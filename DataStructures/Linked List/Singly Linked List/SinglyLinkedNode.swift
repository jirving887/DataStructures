//
//  SinglyLinkedNode.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/21/25.
//

import Foundation

class SinglyLinkedNode<T> {
    var value: T?
    var next: SinglyLinkedNode<T>?
    
    init(value: T?) {
        self.value = value
    }
}
