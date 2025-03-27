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
    func insert_withIndexGreaterThanSize_shouldFillGapWithNilNodes() {
        let sut = DoublyLinkedList<Int>()
        
        sut.insert(4, at: 4)
        
        #expect(sut.toArray() == [nil, nil, nil, nil, 4])
        #expect(sut.nodeAt(3)?.previous != nil)
        #expect(sut.nodeAt(3)?.previous?.value == nil)
        #expect(sut.nodeAt(4)?.previous != nil)
        #expect(sut.nodeAt(4)?.previous?.value == nil)
    }
    
    @Test
    func insert_withEmptyList_shouldAddToBeginningOfList() {
        let sut = DoublyLinkedList<Int>()
        
        sut.insert(0, at: 0)
        
        #expect(sut.toArray() == [0])
    }
    
    @Test
    func insert_withIndexLessThanOne_shouldAddToBeginningOfList() {
        let sut = makeListWithValues()
        
        sut.insert(-1, at: -1)
        
        #expect(sut.toArray() == [-1, 0, 1, 2, 3])
        #expect(sut.nodeAt(3)?.previous?.value == 1)
        #expect(sut.nodeAt(4)?.previous?.value == 2)
    }
    
    @Test
    func insert_withIndexInRange_shouldAddAtCorrectIndex() {
        let sut = makeListWithValues()
        
        sut.insert(5, at: 2)
        
        #expect(sut.toArray() == [0, 1, 5, 2, 3])
        #expect(sut.nodeAt(3)?.previous?.value == 5)
        #expect(sut.nodeAt(2)?.previous?.value == 1)
    }
    
    @Test
    func remove_withIndexGreaterThanSize_shouldReturnNil() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.remove(1) == nil)
    }
    
    @Test
    func remove_withNonEmptyList_shouldReturnRemovedValue() {
        let sut = makeListWithValues()
        
        let removed = sut.remove(2)
        
        #expect(removed == 2)
        #expect(sut.nodeAt(2)?.previous?.value == 1)
        #expect(sut.toArray() == [0, 1, 3])
    }
    
    @Test
    func removeLast_withEmptyList_shouldReturnNil() {
        let sut = DoublyLinkedList<Int>()
        
        #expect(sut.removeLast() == nil)
    }
    
    @Test
    func removeLast_withNonEmptyList_shouldRemoveLastValue() {
        let sut = makeListWithValues()
        
        let removed = sut.removeLast()
        
        #expect(removed == 3)
        #expect(sut.toArray() == [0, 1, 2])
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
