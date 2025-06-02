//
//  Queue.swift
//  DataStructures
//
//  Created by Jonathan Irving on 6/1/25.
//

import Foundation

public protocol Queue<T> {
    associatedtype T
    
    func enqueue(_ element: T)
    func dequeue() -> T?
    func peek() -> T?
    func toArray() -> [T]
}
