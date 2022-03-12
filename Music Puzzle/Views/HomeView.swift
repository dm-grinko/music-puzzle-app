//
//  ContentView.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 2/20/22.
//

import SwiftUI
struct HomeView: View {
    @ObservedObject var vm = ViewModel()
    
    private var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        ZStack {
            Color(.secondary).ignoresSafeArea(.all)
            VStack {
                Text("Music Puzzle")
                    .fontWeight(.bold)
                    .font(.system(.title, design: .rounded))
                    .foregroundColor(Color(.dark))
                
                Spacer()
                
                LazyVGrid(columns: columns) {
                    ForEach (1..<15, id: \.self) { i in
                        NoteButtonView(index: i, notes: $vm.notes) {
                            vm.onNoteClick(index: i)
                        }
                    }
                    StartButtonView() {
                        vm.notes = vm.shuffle()
                    }
                }
                
                Spacer()
                
            }
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
