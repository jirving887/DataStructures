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
        let sut = DoublyLinkedList<Int>(1)
        
        #expect(sut.size() == 1)
    }
    
    @Test
    func clear_shouldClearList() {
        let sut = DoublyLinkedList<Int>(1)
        
        sut.clear()
        
        #expect(sut.size() == 0)
    }

}
