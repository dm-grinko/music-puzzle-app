//
//  HomeView.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.secondary).ignoresSafeArea(.all)
                VStack {
                    Spacer()
                    
                    TitleView()
                    
                    Text("It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using 'Content here, content here', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for 'lorem ipsum' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).")
                        .padding()
                    
                    Spacer()
                    
                    Navigator.navigator(.game) {
                        Text("Start")
                            .padding()
                            .background(Color(.primary))
                            .foregroundColor(Color(.white))
                    }
                    
                    Spacer()
                }
            }
        }.accentColor(Color(.dark))
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
