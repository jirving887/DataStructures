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
        if let head {
            append(element, to: head)
        } else {
            head = DoublyLinkedNode(value: element)
        }
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
        if let head {
            return get(at: index, head)
        }
        return nil
    }
    
    public func size() -> Int {
        if let head {
            return size(head)
        }
        return 0
    }
    
    func toArray() -> [T?] {
        guard let head else {
            return []
        }
        if let next = head.next {
            return [head.value] + toArray(next)
        }
        return [head.value]
    }
    
    func nodeAt(_ index: Int) -> DoublyLinkedNode<T>? {
        if let head {
            return nodeAt(index: index, head)
        }
        return nil
    }
    
    private func size(_ node: DoublyLinkedNode<T>) -> Int {
        if let next = node.next {
            return 1 + size(next)
        }
        return 1
    }
    
    private func get(at index: Int, _ node: DoublyLinkedNode<T>) -> T? {
        if index == 0 {
            return node.value
        } else if let next = node.next {
            return get(at: index - 1, next)
        } else {
            return nil
        }
    }
    
    private func nodeAt(index: Int, _ node: DoublyLinkedNode<T>) -> DoublyLinkedNode<T>? {
        if index == 0 {
            return node
        } else if let next = node.next {
            return nodeAt(index: index - 1, next)
        }
        return nil
    }
    
    private func append(_ element: T?, to node: DoublyLinkedNode<T>) {
        if let next = node.next {
            append(element, to: next)
        } else {
            let nextNode = DoublyLinkedNode<T>(value: element)
            nextNode.previous = node
            node.next = nextNode
        }
    }
    
    private func toArray(_ node: DoublyLinkedNode<T>) -> [T?] {
        if let next = node.next {
            return [node.value] + toArray(next)
        }
        return [node.value]
    }
}
