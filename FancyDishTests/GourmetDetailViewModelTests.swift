//
//  GourmetDetailViewModelTests.swift
//  FancyDish
//
//  Created by yajima toshu on 2021/01/31.
//  


import XCTest
@testable import FancyDish

class GourmetDetailViewModelTests: XCTestCase {

    let viewModel = GourmetDetailViewModel()

    override func setUpWithError() throws {
        viewModel.gourmetDetail = GourmetResponseResults.Shop(id: "1",
                                                          name: "高級テスト",
                                                          logoImage: "http://Logo",
                                                          nameKana: "コウキュウ",
                                                          address: "東京都板橋区",
                                                          stationName: "板橋駅",
                                                          budget: GourmetResponseResults.Shop.Budget(average: "22222"),
                                                          photo: GourmetResponseResults.Shop.Photo(pc: GourmetResponseResults.Shop.Photo.Pc(l: "laergeUrl", m: "3", s: "5")))
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGourmetDetail() throws {
        XCTAssertEqual(viewModel.address, "東京都板橋区")
        XCTAssertEqual(viewModel.shopName, "高級テスト")
        XCTAssertEqual(viewModel.imageUrl, URL(string: "laergeUrl")!)
        
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }


}
