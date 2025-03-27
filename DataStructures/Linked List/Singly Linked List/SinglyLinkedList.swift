//
//  SinglyLinkedList.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/21/25.
//

import Foundation

public class SinglyLinkedList<T>: LinkedList {
    
    private var head: SinglyLinkedNode<T>?
    
    public init(_ head: T? = nil) {
        if let head {
            self.head = SinglyLinkedNode<T>(value: head)
        }
    }
    
    public func insert(_ element: T?, at index: Int) {
        if let head {
            insert(element, at: index, to: head)
        } else if index < 1 {
            head = SinglyLinkedNode(value: element)
        } else {
            head = SinglyLinkedNode(value: nil)
            insert(element, at: index)
        }
    }
    
    public func append(_ element: T?) {
        if let head {
            append(element, to: head)
        } else {
            head = SinglyLinkedNode(value: element)
        }
    }
    
    public func remove(_ index: Int) -> T? {
        guard let head else {
            return nil
        }
        if index < 1 {
            let removed = head.value
            self.head = head.next
            return removed
        }
        return remove(at: index, head)
    }
    
    public func removeLast() -> T? {
        guard let head else {
            return nil
        }
        if head.next == nil {
            let removed = head.value
            self.head = nil
            return removed
        }
        return remove(head)
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
            return 1 + size(head)
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
    
    private func append(_ element: T?, to node: SinglyLinkedNode<T>) {
        if let next = node.next {
            append(element, to: next)
        } else {
            node.next = SinglyLinkedNode<T>(value: element)
        }
    }
    
    private func insert(_ element: T?, at index: Int, to node: SinglyLinkedNode<T>) {
        if index < 1 {
            let newNode = SinglyLinkedNode<T>(value: element)
            newNode.next = node
            head = newNode
        } else if index == 1 {
            let newNode = SinglyLinkedNode<T>(value: element)
            newNode.next = node.next
            node.next = newNode
        } else if let next = node.next {
            insert(element, at: index - 1, to: next)
        } else {
            node.next = SinglyLinkedNode<T>(value: nil)
            insert(element, at: index, to: node)
        }
    }
    
    private func remove(at index: Int, _ node: SinglyLinkedNode<T>) -> T? {
        guard let next = node.next else { return nil }
        if index == 1 {
            let removed = next.value
            node.next = next.next
            return removed
        }
        return remove(at: index - 1, next)
    }
    
    private func remove(_ node: SinglyLinkedNode<T>) -> T? {
        guard let nextNode = node.next else { return nil }
        if let next = nextNode.next {
            return remove(next)
        }
        let removed = nextNode.value
        node.next = nil
        return removed
    }
    
    private func toArray(_ node: SinglyLinkedNode<T>) -> [T?] {
        if let next = node.next {
            return [node.value] + toArray(next)
        }
        return [node.value]
    }
}
