//
//  HasToolbar.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

protocol HasToolbar: BaseRobot {
    func tapCompleteAllTasksButton() -> Self
    func tapCancelAllTasksButton() -> Self
    func tapSortByNameButton() -> Self
}

extension HasToolbar {
    var completeAllTasksButton: XCUIElement { app.toolbars.buttons["Complete All"] }
    var cancelAllTasksButton: XCUIElement { app.toolbars.buttons["cancel-tasks-bar-button-item"] }
    var sortByNameButton: XCUIElement { app.toolbars.buttons["sort-tasks-bar-button-item"] }

    @discardableResult
    func tapCompleteAllTasksButton() -> Self {
        completeAllTasksButton.tap()
        return self
    }
    
    @discardableResult
    func tapCancelAllTasksButton() -> Self {
        XCTAssertTrue(cancelAllTasksButton.exists,
                      "Cancel All tasks button does didn't appear in the toolbar")
        cancelAllTasksButton.tap()
        return self
    }
    
    @discardableResult
    func tapSortByNameButton() -> Self {
        sortByNameButton.tap()
        return self
    }
}
