//
//  PlayButton.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/7/22.
//

import SwiftUI

struct StartButton: View {
    @Binding var title: String
    let onClick: () -> ()
    
    var body: some View {
        Button (action: {
            self.onClick()
        }) {
            Text(self.title)
        }
        .font(.system(size: 18, weight: .bold, design: .default))
        .foregroundColor(Color(.dark))
        .frame(maxWidth: .infinity, maxHeight: 50)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

