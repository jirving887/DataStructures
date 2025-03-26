//
//  DoublyLinkedListTests.swift
//  DataStructuresTests
//
//  Created by Jonathan Irving on 3/26/25.
//

import Testing
@testable import DataStructures

struct DoublyLinkedListTests {

    @Test func size_withEmpty_shouldReturn0() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.size() == 0)
    }
    
    @Test
    func size_withOneNode_shouldReturn1() {
        let sut = DoublyLinkedList<Int>(0)
        
        #expect(sut.size() == 1)
    }
    
    @Test
    func clear_shouldClearList() {
        let sut = DoublyLinkedList<Int>(0)
        
        sut.clear()
        
        #expect(sut.size() == 0)
    }
    
    @Test
    func get_withInvalidIndex_shouldReturnNil() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.get(4) == nil)
    }
    
    @Test
    func get_withValidIndex_shouldReturnCorrectValue() {
        let sut = DoublyLinkedList<Int>(0)
        
        #expect(sut.get(0) == 0)
    }
    
    @Test
    func append_withEmptyList_shouldAddToList() {
        let sut = DoublyLinkedList<Int>()
        
        sut.append(0)
        
        #expect(sut.size() == 1)
        #expect(sut.get(0) == 0)
    }
    
    @Test
    func append_withNonEmptyList_shouldAddToEnd() {
        let sut = DoublyLinkedList<Int>(0)
        
        sut.append(1)
        
        #expect(sut.size() == 2)
        #expect(sut.get(1) == 1)
    }

}
