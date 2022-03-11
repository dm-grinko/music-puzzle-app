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
    
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    HStack {
                        VStack {
                            ForEach (1..<8, id: \.self) { i in
                                HStack {
                                    SoundButton(index: i, notes: $notes) {
                                        onClick(index: i)
                                    }
                                }
                                Spacer (minLength: 30)
                            }
                        }
                        Spacer (minLength: 30)
                        VStack {
                            ForEach (8..<15, id: \.self) { i in
                                HStack {
                                    SoundButton(index: i, notes: $notes) {
                                        onClick(index: i)
                                    }
                                }
                                Spacer (minLength: 30)
                            }
                        }
                    }
                    
                    Spacer(minLength: 30)
                    StartButton(title: $buttonTitle) {
                        notes = ViewModel.start()
                    }
                    Spacer(minLength: 30)
                }
                .padding(30)
            }
            .navigationTitle("Music Puzzle")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color(.secondary).ignoresSafeArea())
        }
        .navigationViewStyle(.stack)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
