//
//  SoundButton.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/7/22.
//

import SwiftUI

private func getForegroundColor(note: Note) -> Color {
    if note.status == Status.ON {
        return Color(.dark)
    }
    
    if note.status == Status.OFF {
        return .white
    }
    
    return Color(.dark)
}

private func getBackground(note: Note) -> Color {
    if note.status == Status.ON {
        return .white
    }
    
    if note.status == Status.OFF {
        return Color(.muted)
    }
    
    return .white
}

struct NoteButtonView: View {
    let index: Int
    @Binding var notes: [Int:Note]
    let onClick: () -> ()

    var body: some View {
        Button (action: {
            self.onClick()
        }) {
            Image(systemName: "music.note")
                .font(.system(size: 30))
                .frame(width: 56, height: 56)
                .foregroundColor(getForegroundColor(note: self.notes[self.index]!))
                .background(getBackground(note: self.notes[self.index]!))
                .clipShape(Circle())
                .scaleEffect(self.notes[self.index]!.status == Status.PENDING ? 1.4 : 1.0)
        }
        .padding(14)
    }
}

