//
//  SubtasksRobot.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class SubtasksRobot: BaseRobot, HasTasks, HasToolbar, HasLogout {
    var backButton: XCUIElement {
        app.navigationBars.buttons["Tasks"].firstMatch
    }
    
    @discardableResult
    func assertSubtasksScreen() -> Self {
        XCTAssertTrue(backButton.waitForExistence(timeout: 5))
        return self
    }
    
    @discardableResult
    func goBack() -> Self {
        backButton.tap()
        return self
    }
}
