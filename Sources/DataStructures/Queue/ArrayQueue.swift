//
//  ArrayQueue.swift
//  DataStructures
//
//  Created by Jonathan Irving on 6/1/25.
//

import Foundation

public class ArrayQueue<T>: Queue {
    
    private var value: [T] = []
    private var limit: Int?
    
    public init(_ limit: Int? = nil) {
        self.limit = limit
    }
    
    public func enqueue(_ element: T) {
        if let limit, value.count == limit {
            value.removeFirst()
        }
        value.append(element)
    }
    
    public func dequeue() -> T? {
        value.isEmpty ? nil : value.remove(at: 0)
    }
    
    public func peek() -> T? {
        value.first
    }
    
    public func toArray() -> [T] {
        value
    }
}
