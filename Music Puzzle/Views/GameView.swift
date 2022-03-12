//
//  ContentView.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 2/20/22.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var vm = ViewModel()
    @ObservedObject var stopwatch = StopwatchViewModel()
    
    private var columns = [
        GridItem(.flexible()),
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    init() {
        print("init game view")
        stopwatch.reset()
        stopwatch.toggle()
    }
    
    var body: some View {
        ZStack {
            Color(.secondary).ignoresSafeArea(.all)
            VStack {
                TitleView()
                
                Spacer()
                
                LazyVGrid(columns: columns) {
                    ForEach (1..<15, id: \.self) { i in
                        NoteButtonView(index: i, notes: $vm.notes) {
                            vm.onNoteClick(index: i)
                        }
                    }
                }
                
                
                Text("\(stopwatch.getTime())")
                
                Spacer()
                
            }
            .padding()
        }
        .onAppear {
            print("GameView onAppear")
            vm.shuffle()
            stopwatch.reset()
        }
        
    }
}

struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView()
    }
}
