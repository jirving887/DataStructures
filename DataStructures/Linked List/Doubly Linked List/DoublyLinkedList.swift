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
        if let head {
            insert(element, at: index, to: head)
        } else if index < 1 {
            head = DoublyLinkedNode(value: element)
        } else {
            head = DoublyLinkedNode(value: nil)
            insert(element, at: index)
        }
    }
    
    public func append(_ element: T?) {
        if let head {
            append(element, to: head)
        } else {
            head = DoublyLinkedNode(value: element)
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
    
    private func insert(_ element: T?, at index: Int, to node: DoublyLinkedNode<T>) {
        if index < 1 {
            let newNode = DoublyLinkedNode<T>(value: element)
            node.previous = newNode
            newNode.next = node
            head = newNode
        } else if index == 1 {
            let newNode = DoublyLinkedNode<T>(value: element)
            newNode.previous = node
            newNode.next = node.next
            node.next = newNode
            newNode.next?.previous = newNode
        } else if let next = node.next {
            insert(element, at: index - 1, to: next)
        } else {
            let newNode = DoublyLinkedNode<T>(value: nil)
            newNode.previous = node
            node.next = newNode
            insert(element, at: index, to: node)
        }
    }
    
    private func remove(at index: Int, _ node: DoublyLinkedNode<T>) -> T? {
        guard let next = node.next else { return nil }
        if index == 1 {
            let removed = next.value
            node.next = next.next
            next.next?.previous = node
            return removed
        }
        return remove(at: index - 1, next)
    }
    
    private func toArray(_ node: DoublyLinkedNode<T>) -> [T?] {
        if let next = node.next {
            return [node.value] + toArray(next)
        }
        return [node.value]
    }
}
