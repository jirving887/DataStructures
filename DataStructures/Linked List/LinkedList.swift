//
//  LinkedList.swift
//  DataStructures
//
//  Created by Jonathan Irving on 3/21/25.
//

import Foundation

protocol LinkedList<T> {
    associatedtype T
    
    func insert(_ element: T, at index: Int)
    func append(_ element: T)
    func remove(_ index: Int) -> T?
    func removeLast() -> T?
    func clear()
    func get(_ index: Int) -> T?
    func size() -> Int
}
