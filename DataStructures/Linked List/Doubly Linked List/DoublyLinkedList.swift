//
//  DoublyLinkedList.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/26/25.
//

import Foundation

public class DoublyLinkedList<T>: LinkedList {
    
    private var head: DoublyLinkedNode<T>?
    
    public init(_ head: T? = nil){
        if let head {
            self.head = DoublyLinkedNode<T>(value: head)
        }
    }
    
    public func insert(_ element: T?, at index: Int) {
        
    }
    
    public func append(_ element: T?) {
        
    }
    
    public func remove(_ index: Int) -> T? {
        nil
    }
    
    public func removeLast() -> T? {
        nil
    }
    
    public func clear() {
        head = nil
    }
    
    public func get(_ index: Int) -> T? {
        nil
    }
    
    public func size() -> Int {
        if let head {
            return size(head)
        }
        return 0
    }
    
    private func size(_ node: DoublyLinkedNode<T>) -> Int {
        if let next = node.next {
            return 1 + size(next)
        }
        return 1
    }
}
