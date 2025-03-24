//
//  SinglyLinkedList.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/21/25.
//

import Foundation

class SinglyLinkedList<T>: LinkedList {
    
    private var head: SinglyLinkedNode<T>?
    
    init(_ head: SinglyLinkedNode<T>? = nil) {
        self.head = head
    }
    
    func insert(_ element: T, at index: Int) {
        guard head != nil else {
            append(element)
            return
        }
    }
    
    func append(_ element: T) {
        if let head {
            append(element, to: head)
        } else {
            head = SinglyLinkedNode(value: element)
        }
    }
    
    func remove(_ index: Int) -> T? {
        nil
    }
    
    func removeLast() -> T? {
        nil
    }
    
    func clear() {
        head = nil
    }
    
    func get(_ index: Int) -> T? {
        if let head {
            return get(at: index, head)
        }
        return nil
    }
    
    func size() -> Int {
        if let head {
            return 1 + size(head)
        }
        return 0
    }
    
    private func size(_ node: SinglyLinkedNode<T>) -> Int {
        if let next = node.next {
            return 1 + size(next)
        }
        return 0
    }
    
    private func get(at index: Int, _ node: SinglyLinkedNode<T>) -> T? {
        if index == 0 {
            return node.value
        } else if let next = node.next {
            return get(at: index - 1, next)
        } else {
            return nil
        }
    }
    
    private func append(_ element: T, to node: SinglyLinkedNode<T>) {
        if let next = node.next {
            append(element, to: next)
        } else {
            node.next = SinglyLinkedNode<T>(value: element)
        }
    }
}
