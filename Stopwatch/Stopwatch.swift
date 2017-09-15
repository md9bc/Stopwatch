//
//  Stopwatch.swift
//  Stopwatch
//
//  Created by Ma'ayan Doron on 9/14/17.
//  Copyright © 2017 Ma'ayan Doron. All rights reserved.
//

import Foundation

class Stopwatch {
    
    fileprivate var startTime: Date?
    
    var elapsedTime: TimeInterval {
        if let startTime = self.startTime {
            return -startTime.timeIntervalSinceNow
        } else {
            return 0
        }
    }
    
    var isRunning: Bool {
        return startTime != nil
    }
    
    func start() {
        startTime = Date()
    }
    
    func stop() {
        startTime = nil
    }
    
}
