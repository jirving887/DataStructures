//
//  DoublyLinkedNode.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/26/25.
//

import Foundation

class DoublyLinkedNode<T> {
    var value: T?
    var next: DoublyLinkedNode<T>?
    weak var previous: DoublyLinkedNode<T>?
    
    init(value: T?) {
        self.value = value
    }
}
