//
//  GdanskNumerekTests.swift
//  GdanskNumerekTests
//
//  Created by Eliasz Sawicki on 06/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import XCTest

class QueueNameExtractorTests: XCTestCase {
    
    let sut = QueueNameExtractor()
    
    override func setUp() {
        super.setUp()
    }
    
    func testShouldReturnNameOnlyWhenLetterWithDashAtFront() {
        let name = sut.extractQueueName("A-Test")
        XCTAssertEqual(name, "Test", "Output should be without prefix letter")
    }
    
    func testShouldReturnNameOnlyWhenSpaceAfterLetterWithDashAtFront() {
        let name = sut.extractQueueName("A- Test")
        XCTAssertEqual(name, "Test", "Output should be without prefix letter")
    }
    
    func testShouldReturnNameOnlyWhenDashAtFrontIsSurroundedBySpaces() {
        let name = sut.extractQueueName("K - KASA - OPŁATY")
        XCTAssertEqual(name, "KASA - OPŁATY", "Output should be without prefix letter")
    }
    
    func testShouldReturnEmptyStringIfOnlyLetterIsPresent() {
        let name = sut.extractQueueName("K")
        XCTAssertEqual(name, "", "Output should be without prefix letter")
    }
    
}
