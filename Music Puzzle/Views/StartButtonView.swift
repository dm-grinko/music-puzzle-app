//
//  PlayButton.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/7/22.
//

import SwiftUI

struct StartButtonView: View {
    let onClick: () -> ()
    
    var body: some View {
        Button (action: {
            self.onClick()
        }) {            
            Image(systemName: "play.fill")
                .font(.system(size: 30))
                .frame(width: 56, height: 56)
                .foregroundColor(Color(.dark))
                .background(.white)
                .clipShape(Circle())
                .scaleEffect(1.1)
        }
    }
}

