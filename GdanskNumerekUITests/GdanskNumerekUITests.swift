//
//  GdanskNumerekUITests.swift
//  GdanskNumerekUITests
//
//  Created by Eliasz Sawicki on 10/03/16.
//  Copyright © 2016 Eliasz Sawicki. All rights reserved.
//

import XCTest

class GdanskNumerekUITests: XCTestCase {
    
    
    override func setUp() {
        super.setUp()
        let app = XCUIApplication()
        setupSnapshot(app)
        app.launch()
        
        snapshot("01MainScreen")
        app.otherElements.childrenMatchingType(.Button).elementBoundByIndex(0).tap()
        snapshot("02QueuesScreen")
        app.scrollViews.otherElements.childrenMatchingType(.Button).elementBoundByIndex(0).tap()
        snapshot("03Number")
        continueAfterFailure = false
    }
    
    func testExample() {
        
    }
    
}
