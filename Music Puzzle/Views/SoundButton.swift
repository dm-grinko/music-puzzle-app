//
//  SoundButton.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/7/22.
//

import SwiftUI

func getForegroundColor(note: Note) -> Color {
    if note.status == Status.ON {
        return .black
    }
    
    if note.status == Status.OFF {
        return .white
    }
    
    return .white
}

func noteBtnBackground(note: Note) -> Color {
    if note.status == Status.ON {
        return .white
    }
    
    if note.status == Status.OFF {
        return .gray
    }
    
    return .red
}

struct SoundButton: View {
    let index: Int
    @Binding var notes: [Int:Note]
    let onClick: () -> ()

    var body: some View {
        Button (action: {
            self.onClick()
        }) {
            Image(systemName: "music.note").padding()
        }
        .foregroundColor(getForegroundColor(note: self.notes[self.index]!))
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(noteBtnBackground(note: self.notes[self.index]!))
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}
