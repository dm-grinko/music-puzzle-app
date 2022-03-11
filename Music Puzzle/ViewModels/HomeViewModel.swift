//
//  HomeViewModel.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/9/22.
//

import Foundation

extension HomeView {
    class ViewModel {
        static func start () -> [Int: Note] {
            var data = [
                1: Note(fileName: "note1", index: 1, status: Status.ON),
                2: Note(fileName: "note2", index: 2, status: Status.ON),
                3: Note(fileName: "note3", index: 3, status: Status.ON),
                4: Note(fileName: "note4", index: 4, status: Status.ON),
                5: Note(fileName: "note5", index: 5, status: Status.ON),
                6: Note(fileName: "note6", index: 6, status: Status.ON),
                7: Note(fileName: "note7", index: 7, status: Status.ON),
                8: Note(fileName: "note1", index: 8, status: Status.ON),
                9: Note(fileName: "note2", index: 9, status: Status.ON),
                10: Note(fileName: "note3", index: 10, status: Status.ON),
                11: Note(fileName: "note4", index: 11, status: Status.ON),
                12: Note(fileName: "note5", index: 12, status: Status.ON),
                13: Note(fileName: "note6", index: 13, status: Status.ON),
                14: Note(fileName: "note7", index: 14, status: Status.ON)
            ]
            
            // shuffle items 10 times
            (1..<10).forEach { i in
                let firstKey = Int.random(in: 1..<15)
                let secondKey = Int.random(in: 1..<15)
                let temp = data[firstKey]
                data[firstKey] = data[secondKey]
                data[secondKey] = temp
            }

            // fix order after shuffling
            var notes = [Int:Note]()
            for (key, value) in data {
                notes[key] = Note(
                    fileName: value.fileName,
                    index: key,
                    status: value.status
                )
            }
            
            return notes
        }
    }
}
