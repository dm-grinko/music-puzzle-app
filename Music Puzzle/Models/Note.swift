//
//  Note.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/9/22.
//

import Foundation
import SwiftUI

enum Status {
    case ON
    case OFF
    case PENDING
}

struct Note {
    var fileName: String
    var index: Int
    var status: Status
}
