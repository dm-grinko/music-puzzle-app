//
//  ContentView.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 2/20/22.
//

import SwiftUI
import AVFoundation
var audioPlayer: AVAudioPlayer?

struct HomeView: View {
    @State var buttonTitle: String = "Start"
    @State var prevNote: Note?
    @State var notes: [Int:Note] = ViewModel.start()
    
    func playNote (fileName: String) {
        let sound = Bundle.main.path(forResource: fileName, ofType: "wav")
        
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            guard let player = audioPlayer else { return }

            player.prepareToPlay()
            player.play()
        } catch let error {
            print(error)
        }
    }

    func onClick (index: Int) {
        if notes[index]?.status != Status.OFF { // don't click on the disabled note
            if prevNote == nil { // on attempt start
                notes[index]?.status = Status.PENDING
                prevNote = notes[index]!
            } else {

                    if prevNote?.index == notes[index]?.index { // don't click on the same note
                        return
                    }
                    if prevNote?.fileName == notes[index]?.fileName { // on success
                        notes[prevNote!.index]?.status = Status.OFF
                        notes[index]?.status = Status.OFF
                    } else { // on failure
                        notes[prevNote!.index]?.status = Status.ON
                        notes[index]?.status = Status.ON
                    }
                    prevNote = nil
                
            }
            
            if notes.first(where: { $0.value.status != Status.OFF }) != nil {
                buttonTitle = "Restart"
            } else {
                buttonTitle = "Start"
            }
            
            playNote(fileName: notes[index]!.fileName)
        }
    }
    
    var columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
            ZStack {
                Color(.secondary).ignoresSafeArea(.all)
                VStack {
                    Text("Music Puzzle")
                        .fontWeight(.bold)
                        .font(.system(.title, design: .rounded))
                        .foregroundColor(Color(.primary))
                    
                    Spacer()
                    
                    LazyVGrid(columns: columns) {
                        ForEach (1..<15, id: \.self) { i in
                            SoundButton(index: i, notes: $notes) {
                                onClick(index: i)
                            }
                        }
                    }
                    
                    Spacer(minLength: 30)
                    StartButton(title: $buttonTitle) {
                        notes = ViewModel.start()
                    }
                    Spacer(minLength: 30)
                }
                .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
