//
//  ArrayQueue.swift
//  DataStructures
//
//  Created by Jonathan Irving on 6/1/25.
//

import Foundation

class ArrayQueue<T>: Queue {
    
    private var value: [T] = []
    private var limit: Int?
    
    init(_ limit: Int? = nil) {
        self.limit = limit
    }
    
    func enqueue(_ element: T) {
        if let limit, value.count == limit {
            value.removeFirst(1)
        }
        value.append(element)
    }
    
    func dequeue() -> T? {
        value.isEmpty ? nil : value.remove(at: 0)
    }
    
    func peek() -> T? {
        nil
    }
    
    func toArray() -> [T] {
        value
    }
}
