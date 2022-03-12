//
//  NoteButtonViewModel.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import Foundation
import SwiftUI

extension NoteButtonView {
    class ViewModel {
        public func getForegroundColor(note: Note) -> Color {
            if note.status == Status.ON {
                return Color(.dark)
            }
            
            if note.status == Status.OFF {
                return .white
            }
            
            return Color(.dark)
        }

        public func getBackground(note: Note) -> Color {
            if note.status == Status.ON {
                return .white
            }
            
            if note.status == Status.OFF {
                return Color(.muted)
            }
            
            return .white
        }
    }
}
