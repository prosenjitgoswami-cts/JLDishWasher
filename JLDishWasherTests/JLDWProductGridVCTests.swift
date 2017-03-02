//
//  JLDWProductGridVCTests.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import XCTest
import Foundation

let TestJsonFileForProductsListWith21Products = "TestJsonFileForProductsListWith21Products"
let TestJsonFileForProductsListWithNoProduct = "TestJsonFileForProductsListWithNoProducts"


class JLDWProductGridVCTests: XCTestCase {

    lazy var presenter: ProductGridViewControllerPresenter = {
        return ProductGridViewControllerPresenter()
    }()

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

    // Check the Response Json response is valid
    func testCheckThatResponseContainsValidResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWith21Products) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            XCTAssertTrue(productLists.count > 0)
        }
    }

    // Check the Response Json containts Max 20 results
    func testJsonFileForProductsListWithMax20Products() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWith21Products) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)
            XCTAssertTrue(productLists.count == 20)
        }
    }


    // Check the Response Json response is nil
    func testCheckThatResponseContainsNilResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            XCTAssertTrue(productLists.count ==  0)
        }
    }

}





