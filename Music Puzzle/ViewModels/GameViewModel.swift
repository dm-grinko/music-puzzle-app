//
//  HomeViewModel.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/9/22.
//

import Foundation

import AVFoundation
var audioPlayer: AVAudioPlayer?

let defaultNotes: [Int: Note] = [
    1: .init(fileName: "note1", index: 1, status: Status.ON),
    2: .init(fileName: "note2", index: 2, status: Status.ON),
    3: .init(fileName: "note3", index: 3, status: Status.ON),
    4: .init(fileName: "note4", index: 4, status: Status.ON),
    5: .init(fileName: "note5", index: 5, status: Status.ON),
    6: .init(fileName: "note6", index: 6, status: Status.ON),
    7: .init(fileName: "note7", index: 7, status: Status.ON),
    8: .init(fileName: "note1", index: 8, status: Status.ON),
    9: .init(fileName: "note2", index: 9, status: Status.ON),
    10: .init(fileName: "note3", index: 10, status: Status.ON),
    11: .init(fileName: "note4", index: 11, status: Status.ON),
    12: .init(fileName: "note5", index: 12, status: Status.ON),
    13: .init(fileName: "note6", index: 13, status: Status.ON),
    14: .init(fileName: "note7", index: 14, status: Status.ON)
]

extension GameView {
    class ViewModel: ObservableObject {
        @Published var prevNote: Note?
        @Published var notes: [Int: Note] = defaultNotes
        
        init () {
            print("init game view model")
            shuffle()
        }
        
        func shuffle() {
            var dict = defaultNotes
            // shuffle items 10 times
            (1..<10).forEach { i in
                let firstKey = Int.random(in: 1..<15)
                let secondKey = Int.random(in: 1..<15)
                let temp = dict[firstKey]
                dict[firstKey] = dict[secondKey]
                dict[secondKey] = temp
            }

            // fix order after shuffling
            // value of note.index should be equal to its index in the dictionary notes
            for (key, value) in dict {
                dict[key] = Note(
                    fileName: value.fileName,
                    index: key,
                    status: value.status
                )
            }
            
            print("shuffled")
            
            notes = dict
        }
        
        private func playNote (fileName: String) {
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

        public func onNoteClick (index: Int) {
            if self.notes[index]?.status != Status.OFF { // don't click on the disabled note
                if prevNote == nil { // on attempt
                    self.notes[index]?.status = Status.PENDING
                    prevNote = self.notes[index]
                } else {

                    if prevNote?.index == self.notes[index]?.index { // don't click on the same note
                            return
                        }
                    if prevNote?.fileName == self.notes[index]?.fileName { // on success
                        self.notes[prevNote!.index]?.status = Status.OFF
                        self.notes[index]?.status = Status.OFF
                        } else { // on failure
                            self.notes[prevNote!.index]?.status = Status.ON
                            self.notes[index]?.status = Status.ON
                        }
                        prevNote = nil
                    
                }
                
                playNote(fileName: self.notes[index]!.fileName)
            }
        }
        
    }
}
