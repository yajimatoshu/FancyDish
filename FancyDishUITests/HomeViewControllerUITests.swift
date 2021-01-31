//
//  FancyDishUITests.swift
//  FancyDishUITests
//
//  Created by yajima toshu on 2021/01/12.
//

import XCTest

class HomeViewControllerUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }

    override func tearDownWithError() throws {
    }

    func testHomeViewController() throws {
        XCTContext.runActivity(named: "初期表示BarButton") { activity in
            let barButtonItem = app.buttons["HomeVIewController_right_bar_button"]
            XCTAssertTrue(barButtonItem.exists)
            XCTAssertEqual(barButtonItem.label, "条件")
        }
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
