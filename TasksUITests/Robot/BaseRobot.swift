//
//  BaseRobot.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class BaseRobot {
    let app: XCUIApplication
    var alerts: XCUIElementQuery { app.alerts }
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    @discardableResult
    func launchApp() -> Self {
        app.launch()
        return self
    }
    
    @discardableResult
    func assertAlertAppeared(withTitle title: String?, text: String? = nil) -> Self {
        let alert = alerts.firstMatch
        XCTAssertTrue(alert.waitForExistence(timeout: 5), "Alert did not appear in a reasonable amount of time")
        if let title = title {
            XCTAssertTrue(alerts[title].waitForExistence(timeout: 5), "Alert title: \(title) did not match")
        }
        if let text = text {
            XCTAssertEqual(alert.staticTexts[text].label, text, "Alert text: \(text) did not match")
        }
        return self
    }
        
    @discardableResult
    func dismissKeyboardByTappingReturnKey() -> Self {
        if app.keyboards.firstMatch.isHittable {
            app.keyboards.buttons["Return"].firstMatch.tap()
        }
        return self
    }
    
    var isRunningOniPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
   }
}
