//
//  BankAppUITests.swift
//  BankAppUITests
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import XCTest

class BankAppUITests: XCTestCase {
    var app: XCUIApplication!

    // MARK: - XCTestCase

    override func setUp() {
        super.setUp()

        // Since UI tests are more expensive to run, it's usually a good idea
        // to exit if a failure was encountered
        continueAfterFailure = false

        app = XCUIApplication()

        // We send a command line argument to our app,
        // to enable it to reset its state
        app.launchArguments.append("--uitesting")
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testEnable() {
        app.launch()
        XCTAssertTrue(app.isEnabled)
    }
    
    func testLogin()
    {
        app.launch()
        
        XCTAssertTrue(app.isEnabled)
        
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].clearText(andReplaceWith: "example")
        app.textFields["Enter password"].tap()
        app.textFields["Enter password"].clearText(andReplaceWith: "123")
        
        app.buttons["Enter"].tap()
        
        XCTAssertEqual(app.navigationBars.element.identifier, "BankApp.TabbarView")
    }
    
    func testReturnToLoginView()
    {
        app.launch()
        
        XCTAssertTrue(app.isEnabled)
        
        app.textFields["Enter login"].tap()
        app.textFields["Enter login"].clearText(andReplaceWith: "example")
        app.textFields["Enter password"].tap()
        app.textFields["Enter password"].clearText(andReplaceWith: "123")
        
        app.buttons["Enter"].tap()
        
        XCTAssertEqual(app.navigationBars.element.identifier, "BankApp.TabbarView")
        
        app.navigationBars["BankApp.TabbarView"].buttons["Login"].tap()
        
        
        //app.tabBars.buttons["Currency"].tap();
        
         XCTAssertEqual(app.navigationBars.element.identifier, "Login")
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}

extension XCUIElement {
    func clearText(andReplaceWith newText:String? = nil) {
        tap()
        press(forDuration: 1.0)
        var select = XCUIApplication().menuItems["Select All"]

        if !select.exists {
            select = XCUIApplication().menuItems["Select"]
        }
        //For empty fields there will be no "Select All", so we need to check
        if select.waitForExistence(timeout: 0.5), select.exists {
            select.tap()
            typeText(String(XCUIKeyboardKey.delete.rawValue))
        } else {
            tap()
        }
        if let newVal = newText {
            typeText(newVal)
        }
    }
}
		
