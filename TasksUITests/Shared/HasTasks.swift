//
//  HasTasks.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

protocol HasTasks: BaseRobot {
    func toggleTask(atIndex index: Int) -> Self
    func toggleTask(withTitle title: String) -> Self
    
    func assertANumberOfTasks(_ numberOfTasks: Int) -> Self
    func assertTaskIs(_ status: TaskStatus, withTitle title: String) -> Self
    func assertTaskIs(_ status: TaskStatus, atIndex index: Int) -> Self
    func assertAllTasksAre(_ status: TaskStatus) -> Self
    func assertTasksAreSortedByName() -> Self
}

// MARK: Actions
extension HasTasks {
    var taskCells: XCUIElementQuery { app.cells }
    func getTaskCell(withTitle title: String) -> XCUIElement {
        let query = taskCells.containing(.staticText, identifier: title)
        XCTAssertEqual(query.count, 1, "Expected exactly one task cell with title '\(title)', but found \(query.count)")
        return query.firstMatch
    }

    @discardableResult
    func toggleTask(atIndex index: Int) -> Self {
        taskCells.element(boundBy: index).tap()
        return self
    }
    
    @discardableResult
    func toggleTask(withTitle title: String) -> Self {
        getTaskCell(withTitle: title).tap()
        return self
    }
}
// MARK: Assertions
extension HasTasks {
    @discardableResult
    func assertANumberOfTasks(_ numberOfTasks: Int) -> Self {
        XCTAssertEqual(taskCells.count, numberOfTasks, "Expected \(numberOfTasks) tasks, but found \(taskCells.count)")
        return self
    }
    
    @discardableResult
    func assertTaskIs(_ status: TaskStatus, withTitle title: String) -> Self {
        let taskCell = getTaskCell(withTitle: title)
        XCTAssertEqual(taskCell.checkmarkImage.stringValue, status.rawValue, "Checkmark image for task '\(title)' was not set correctly.")
        return self
    }
    
    @discardableResult
    func assertTaskIs(_ status: TaskStatus, atIndex index: Int) -> Self {
        XCTAssertEqual(taskCells.element(boundBy: index).checkmarkImage.stringValue, status.rawValue, "Checkmark image for task with index '\(index)' was not set correctly.")
        return self
    }

    @discardableResult
    func assertAllTasksAre(_ status: TaskStatus) -> Self {
        for taskCell in taskCells.allElementsBoundByIndex {
            XCTAssertEqual(
                taskCell.checkmarkImage.stringValue,
                status.rawValue,
                "Checkmark image for task '\(taskCell.staticTexts.firstMatch.label)' was not set correctly."
            )
        }
        return self
    }

    @discardableResult
    func assertTasksAreSortedByName() -> Self {
        let cellNames: [String] = taskCells.allElementsBoundByIndex.map { $0.staticTexts.firstMatch.label }
        XCTAssertEqual(cellNames, cellNames.sorted(), "Tasks list was not sorted by name properly.")
        return self
    }
}
