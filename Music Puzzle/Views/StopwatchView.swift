//
//  Timer.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import SwiftUI

struct StopwatchView: View {
    @ObservedObject var stopwatch = StopwatchViewModel()
        
    var body: some View {
        VStack {
            Text("\(stopwatch.getTime())")
            
            VStack {
                Button("Stop / Start") {
                    stopwatch.toggle()
                }
                
                Button("Reset") {
                    stopwatch.reset()
                }
                
            }
        }
    }
}

struct Timer_Previews: PreviewProvider {
    static var previews: some View {
        StopwatchView()
    }
}
