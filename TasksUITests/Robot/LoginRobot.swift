//
//  LoginRobot.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

class LoginRobot: BaseRobot {
    var emailTextField: XCUIElement { app.textFields["password-text-field"] }
    var passwordTextField: XCUIElement { app.secureTextFields["Password"] }
    var loginButton: XCUIElement { app.buttons["login-button"] }
    
    // MARK: Actions
    @discardableResult
    func login(email: String, password: String) -> Self {
        enterEmail(email: email)
        enterPassword(password: password)
        dismissKeyboardByTappingReturnKey()
        tapLoginButton()
        return self
    }
    
    @discardableResult
    func logInIfLoggedOut() -> Self {
        if loginButton.exists {
            login(email: Constants.ValidCreds.username,
                  password: Constants.ValidCreds.password)
        }
        return self
    }

    @discardableResult
    func enterEmail(email: String) -> Self {
        emailTextField.tap()
        emailTextField.typeText(email)
        return self
    }
    
    @discardableResult
    func enterPassword(password: String) -> Self {
        passwordTextField.tap()
        passwordTextField.typeText(password)
        return self
    }
    
    @discardableResult
    func tapLoginButton() -> Self {
        loginButton.tap()
        return self
    }
    
    // MARK: Assertions
    @discardableResult
    func verifyLoginButtonDisabled() -> Self {
        XCTAssertFalse(loginButton.isEnabled, "Login button is enabled, but it should be disabled")
        return self
    }
    
    @discardableResult
    func verifyIfLoginButtonEnabled() -> Self {
        XCTAssertTrue(loginButton.isEnabled, "Login button is not enabled, but it should be enabled")
        return self
    }
    
    @discardableResult
    func assertLoginScreen() -> Self {
        let elements = [emailTextField,
                        passwordTextField,
                        loginButton]
        XCTAssertTrue(elements.waitForExistence(timeout: 5), "Some elements are not present")
        return self
    }
}
