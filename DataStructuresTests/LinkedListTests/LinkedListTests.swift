//
//  LinkedListTests.swift
//  DataStructuresTests
//
//  Created by Jonathan Irving on 3/21/25.
//

import Testing
@testable import DataStructures

struct LinkedListTests {

    @Test
    func size_withEmpty_shouldReturn0() {
        let sut = SinglyLinkedList<Int>()
        
        #expect(sut.size() == 0)
    }
    
    @Test
    func size_withOneNode_shouldReturn1() {
        let sut = SinglyLinkedList<Int>(SinglyLinkedNode(value: 1))
        
        #expect(sut.size() == 1)
    }
    
    @Test
    func size_withMultipleNodes_shouldReturnCorrectSize() {
        let sut = makeListWithValues()
        
        #expect(sut.size() == 4)
    }
    
    @Test
    func clear_shouldClearList() {
        let node1 = SinglyLinkedNode(value: 1)
        let sut = SinglyLinkedList<Int>(node1)
        
        sut.clear()
        
        #expect(sut.size() == 0)
    }
    
    @Test
    func get_withInvalidIndex_shouldReturnNil() {
        let sut = SinglyLinkedList<Int>()
        
        #expect(sut.get(4) == nil)
    }
    
    @Test
    func get_withValidIndex_shouldReturnCorrectValue() {
        let sut = makeListWithValues()
        
        #expect(sut.get(2) == 2)
    }
    
    @Test
    func append_withEmptyList_shouldAddToList() {
        let sut = SinglyLinkedList<Int>()
        
        sut.append(0)
        
        #expect(sut.size() == 1)
        #expect(sut.get(0) == 0)
    }
    
    @Test
    func append_withNonEmptyList_shouldAddToEnd() {
        let sut = makeListWithValues()
        
        sut.append(4)
        
        #expect(sut.size() == 5)
        #expect(sut.get(4) == 4)
    }
    
    @Test
    func insert_withEmptyList_shouldAddToList() {
        let sut = SinglyLinkedList<Int>()
        
        sut.insert(4, at: 4)
        
        #expect(sut.size() == 1)
        #expect(sut.get(0) == 4)
    }
    
    // MARK: Helper functions
    
    private func makeListWithValues() -> SinglyLinkedList<Int> {
        let node1 = SinglyLinkedNode(value: 0)
        let node2 = SinglyLinkedNode(value: 1)
        let node3 = SinglyLinkedNode(value: 2)
        let node4 = SinglyLinkedNode(value: 3)
        node3.next = node4
        node2.next = node3
        node1.next = node2
        
        return SinglyLinkedList<Int>(node1)
    }
}
