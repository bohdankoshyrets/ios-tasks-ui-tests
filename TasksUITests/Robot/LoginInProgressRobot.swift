//
//  LoginInProgressRobot.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class LoginInProgressRobot: BaseRobot {
    var loginActivityIndicator: XCUIElement { app.activityIndicators["login-activity-indicator"] }
    var loginLabel: XCUIElement { app.staticTexts["login-label"] }
    var errorAlert: XCUIElement { app.alerts["Error"] }
    
    @discardableResult
    func assertLoginInProgressScreen() -> Self {
        XCTAssertTrue(loginActivityIndicator.exists, "Login activity indicator does not exist, but it should")
        return self
    }
    
    func waitToFinishLogin() {
        XCTAssertTrue(loginActivityIndicator.waitForNonExistence(timeout: 10), "Login took too long to finish")
        XCTAssertFalse(errorAlert.exists, "Error alert appeared while login was in progress")
    }
}
