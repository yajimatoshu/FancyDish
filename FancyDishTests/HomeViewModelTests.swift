//
//  FancyDishTests.swift
//  FancyDishTests
//
//  Created by yajima toshu on 2021/01/12.
//

import XCTest
@testable import FancyDish

class HomeViewModelTests: XCTestCase {
    
    let viewModel = HomeViewModel()

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testFetchGourmet() {
        let exp = XCTestExpectation(description: "fetch gourmet")
        viewModel.fetchGourmet { result in
            XCTAssertNotNil(result)
            // stubにするべきか。
            XCTAssertEqual(self.viewModel.shopsCount, 60)
            exp.fulfill()
        }
        // 5秒以内にfulfillが呼び出されないとエラー
        wait(for: [exp], timeout: 5.0)
    }
    
    func testCount() {
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
