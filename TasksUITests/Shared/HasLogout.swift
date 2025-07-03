//
//  HasLogout.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 03.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

protocol HasLogout: BaseRobot {
    func tapLogoutButton() -> Self
    func confirmLogout() -> Self
}

extension HasLogout {
    var navbar: XCUIElement { app.navigationBars.firstMatch }
    var toolbar: XCUIElement { app.toolbars.firstMatch }
    var logoutButton: XCUIElement {
        if isRunningOniPad {
            return toolbar.buttons["Logout"].firstMatch
        } else {
            return navbar.buttons["Logout"].firstMatch
        }
    }
    var logoutAlertButton: XCUIElement { alerts.buttons["Logout"].firstMatch }

    @discardableResult
    func tapLogoutButton() -> Self {
        logoutButton.tap()
        return self
    }
    
    @discardableResult
    func confirmLogout() -> Self {
        logoutAlertButton.tap()
        return self
    }
}
