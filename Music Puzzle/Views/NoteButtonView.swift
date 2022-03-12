//
//  SoundButton.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/7/22.
//

import SwiftUI

struct NoteButtonView: View {
    let index: Int
    @Binding var notes: [Int:Note]
    let onClick: () -> ()
    
    var vm = ViewModel()

    var body: some View {
        Button (action: {
            self.onClick()
        }) {
            Image(systemName: "music.note")
                .font(.system(size: 30))
                .frame(width: 56, height: 56)
                .foregroundColor(vm.getForegroundColor(note: self.notes[self.index]!))
                .background(vm.getBackground(note: self.notes[self.index]!))
                .clipShape(Circle())
                .scaleEffect(self.notes[self.index]!.status == Status.PENDING ? 1.4 : 1.0)
        }
        .padding(14)
    }
}

