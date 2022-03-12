//
//  GameTimerViewModel.swift
//  Music Puzzle
//
//  Created by Dmitry Grinko on 3/12/22.
//

import Foundation

class StopwatchViewModel: ObservableObject {
    private var timer: Timer?
    private var isRunning = false
    
    @Published private var progressTime: Int = 0
       
    private func start() {
        self.timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { _ in
            self.progressTime += 1
        })
    }
    
    private func stop() {
        self.timer?.invalidate()
    }
    
    public func toggle() {
        if isRunning {
            self.stop()
        } else {
            self.start()
        }
        isRunning.toggle()
    }
    
    public func reset() {
        self.progressTime = 0
    }
    
    public func getTime() -> Int {
        return self.progressTime
    }
}
