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
    func size_withManyNodes_shouldReturn1() {
        let sut = makeListWithValues()
        
        #expect(sut.size() == 4)
    }
    
    @Test
    func clear_shouldClearList() {
        let sut = makeListWithValues()
        
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
        let sut = makeListWithValues()
        
        #expect(sut.get(2) == 2)
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
        let sut = makeListWithValues()
        
        sut.append(4)
        
        #expect(sut.size() == 5)
        #expect(sut.get(4) == 4)
    }
    
    @Test
    func nodeAt_withEmptyList_shouldReturnNil() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.elementAt(0) == nil)
    }
    
    @Test
    func nodeAt_withNonEmptyList_shouldReturnCorrectValue() {
        let sut = makeListWithValues()
        
        #expect(sut.elementAt(2)?.value == 2)
    }

    // MARK: Helper functions
    
    private func makeListWithValues() -> DoublyLinkedList<Int> {
        let list = DoublyLinkedList<Int>()
        for i in 0...3 {
            list.append(i)
        }
        return list
    }
}
