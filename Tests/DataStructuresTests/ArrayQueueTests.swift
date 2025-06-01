//
//  ArrayQueueTests.swift
//  DataStructures
//
//  Created by Jonathan Irving on 6/1/25.
//

import Testing
@testable import DataStructures

struct ArrayQueueTests {

    @Test
    func enqueue_withNoLimit_shouldAddToQueue() {
        let sut = ArrayQueue<Int>()
        
        sut.enqueue(0)
        
        #expect(sut.toArray() == [0])
    }
    
    @Test
    func enqueue_withLimit_shouldAddToQueueAndRemoveOldest() {
        let sut = ArrayQueue<Int>(2)
        
        sut.enqueue(0)
        sut.enqueue(1)
        sut.enqueue(2)
        
        #expect(sut.toArray() == [1, 2])
    }
}
