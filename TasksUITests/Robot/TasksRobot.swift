//
//  TasksRobot.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

enum TaskStatus: String {
    case completed = "Selected"
    case notCompleted = "Not selected"
}

class TasksRobot: BaseRobot, HasTasks, HasToolbar, HasLogout {
    var navbar: XCUIElement { app.navigationBars["Tasks"].firstMatch }
    func moreInfoButton(forTaskCell cell: XCUIElement) -> XCUIElement {
        let moreInfoButton = cell.buttons["More Info"].firstMatch
        XCTAssertTrue(moreInfoButton.exists, "There's no 'More Info' button for task cell: \(cell.staticTexts.firstMatch)")
        return moreInfoButton
        
    }
        
    // MARK: Actions
    @discardableResult
    func logoutIfLoggedIn() -> Self {
        if logoutButton.exists {
            tapLogoutButton()
            confirmLogout()
        }
        return self
    }
     
    // TODO: Review
    @discardableResult
    func tapMoreInfoButton(atIndex index: Int) -> Self {
        let taskCell = taskCells.element(boundBy: index)
        XCTAssertTrue(moreInfoButton(forTaskCell: taskCell).exists)
        return self
    }
    
    @discardableResult
    func tapMoreInfoButton(forTask taskTitle: String) -> Self {
        let taskCell = getTaskCell(withTitle: taskTitle)
        taskCell.moreInfoButton.tap()
        return self
    }
    
    // MARK: Assertions
    @discardableResult
    func assertTasksScreen() -> Self {
        let elements = [completeAllTasksButton,
                        sortByNameButton,
                        logoutButton]
        XCTAssertTrue(elements.waitForExistence(timeout: 5))
        return self
    }

    @discardableResult
    func assertCancelAllTasksButtonExists() -> Self {
        XCTAssertTrue(cancelAllTasksButton.exists)
        return self
    }
}
