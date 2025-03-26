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

}
