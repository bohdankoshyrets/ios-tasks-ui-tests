//
//  Array+XCUIElement.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

extension Array where Element: XCUIElement {
    func waitForExistence(timeout: TimeInterval) -> Bool {
        let predicate = NSPredicate(format: "exists == true")
        let expectations = map { XCTNSPredicateExpectation(predicate: predicate, object: $0) }
        return XCTWaiter().wait(for: expectations, timeout: timeout) == XCTWaiter.Result.completed
    }
}

