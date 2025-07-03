//
//  LoginTests.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class LoginTests: BaseTest {
    
    override func setUp() {
        super.setUp()
        
        TasksRobot(app: app)
            .launchApp()
            .logoutIfLoggedIn()
        
        LoginRobot(app: app)
            .assertLoginScreen()
    }
    
    func test_enterValidCreds_successfullyLoggedIn() throws {
        LoginRobot(app: app)
            .enterEmail(email: Constants.ValidCreds.username)
            .enterPassword(password: Constants.ValidCreds.password)
            .dismissKeyboardByTappingReturnKey()
            .verifyIfLoginButtonEnabled()
            .tapLoginButton()
        
        LoginInProgressRobot(app: app)
            .assertLoginInProgressScreen()
            .waitToFinishLogin()
        
        TasksRobot(app: app)
            .assertTasksScreen()
    }
    
    func test_enterInvalidCreds_showsError() throws {
        LoginRobot(app: app)
            .enterEmail(email: Constants.InvalidCreds.username)
            .enterPassword(password: Constants.InvalidCreds.password)
            .dismissKeyboardByTappingReturnKey()
            .tapLoginButton()
            .verifyAlertAppeared(withTitle: "Error", text: "Incorrect login or password format")
    }
    
    func test_enterNoCreds_loginButtonDisabled() throws {
        LoginRobot(app: app)
            .enterEmail(email: "")
            .enterPassword(password: Constants.ValidCreds.password)
            .verifyLoginButtonDisabled()
    }
}
