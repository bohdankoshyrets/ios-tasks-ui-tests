//
//  XCUIElement.swift
//  Tasks
//
//  Created by Bohdan Koshyrets on 02.07.2025.
//  Copyright © 2025 Cultured Code. All rights reserved.
//

import XCTest

extension XCUIElement {
    var moreInfoButton: XCUIElement {
        let moreInfoButton = self.buttons["More Info"].firstMatch
        XCTAssertTrue(moreInfoButton.exists, "There's no 'More Info' button for task cell: \(self.staticTexts.firstMatch.label)")
        return moreInfoButton
    }
    
    var checkmarkImage: XCUIElement {
        let checkmark = self.images["cell_image_view"].firstMatch
        XCTAssertTrue(checkmark.exists, "There's no checkmark image for task cell: \(self.staticTexts.firstMatch.label)")
        return checkmark
    }
    
    var stringValue: String? {
        self.value as? String
    }
}
