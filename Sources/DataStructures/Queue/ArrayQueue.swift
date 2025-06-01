//
//  ArrayQueue.swift
//  DataStructures
//
//  Created by Jonathan Irving on 6/1/25.
//

import Foundation

class ArrayQueue<T>: Queue {
    
    private var value: [T] = []
    
    func enqueue(_ element: T) {
        value.append(element)
    }
    
    func dequeue() -> T? {
        nil
    }
    
    func toArray() -> [T] {
        value
    }
}
