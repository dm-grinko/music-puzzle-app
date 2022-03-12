//
//  TitleView.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import SwiftUI

struct TitleView: View {
    var body: some View {
        Text("Music Puzzle")
            .fontWeight(.bold)
            .font(.system(.title, design: .rounded))
            .foregroundColor(Color(.dark))
    }
}

struct TitleView_Previews: PreviewProvider {
    static var previews: some View {
        TitleView()
    }
}
