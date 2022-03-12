//
//  Navigator.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import Foundation
import SwiftUI

enum Route {
    case game
}

struct Navigator {
    static func navigator<T: View> (_ route: Route, content: () -> T) -> AnyView {
        switch route {
            case .game:
                return AnyView(
                    NavigationLink(
                        destination: GameView()
                    ) {
                        content()
                    }
                )
            }
    }
}
