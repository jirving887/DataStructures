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
    func size_withManyNodes_shouldReturnSize() {
        let sut = makeListWithValues()
        
        #expect(sut.size() == 4)
    }
    
    @Test
    func clear_shouldClearList() {
        let sut = makeListWithValues()
        
        sut.clear()
        
        #expect(sut.toArray() == [])
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
        
        #expect(sut.toArray() == [0])
    }
    
    @Test
    func append_withNonEmptyList_shouldAddToEnd() {
        let sut = makeListWithValues()
        
        sut.append(4)
        
        #expect(sut.toArray() == [0, 1, 2, 3, 4])
        #expect(sut.nodeAt(4)?.previous?.value == 3)
    }
    
    @Test
    func nodeAt_withEmptyList_shouldReturnNil() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.nodeAt(0) == nil)
    }
    
    @Test
    func nodeAt_withNonEmptyList_shouldReturnCorrectValue() {
        let sut = makeListWithValues()
        
        #expect(sut.nodeAt(2)?.value == 2)
    }
    
    @Test
    func toArray_shouldListAllValues() {
        let sut = makeListWithValues()
        
        #expect(sut.toArray() == [0, 1, 2, 3])
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
