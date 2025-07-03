//
//  BaseTest.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class BaseTest: XCTestCase {
    let app = XCUIApplication()
    
    override class var runsForEachTargetApplicationUIConfiguration: Bool {
        true
    }
    
    override func setUp() {
        continueAfterFailure = false
    }
    
    func launchApp() -> Self {
        app.launch()
        return self
    }
}
