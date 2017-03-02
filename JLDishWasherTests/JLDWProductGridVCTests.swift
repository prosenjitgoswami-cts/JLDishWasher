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
let TestJsonFileForProductsListWithValidProducts = "TestJsonFileForProductsListWithValidProducts"


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

    // Check the Response Json response is valid Product DataModel
    func testCheckThatResponseContainsValidProductDataModel() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product)
        }
    }

    // Check the Response Json response containts not null product id
    func testCheckThatResponseContainsNotNUllProductId() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.productId)
        }
    }

    // Check the Response Json response has  product id
    func testCheckThatResponseHasValidProductId() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.productId == "1913470")
        }
    }

    // Check the Response Json response containts not null title
    func testCheckThatResponseContainsNotNUllTitle() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.title)
        }
    }

    // Check the Response Json response has  product id
    func testCheckThatResponseHasValidTitle() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.title == "Bosch SMV53M40GB Fully Integrated Dishwasher")
        }
    }


    // Check the Response Json response containts not null imageURLString
    func testCheckThatResponseContainsNotNUllImageURLString() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.imageURLString)
        }
    }

    // Check the Response Json response has  imageURLString
    func testCheckThatResponseHasValidImageURLString() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.imageURLString == "//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
        }
    }

    // Check the Response Json response containts not null ProductPrise dictionary
    func testCheckThatResponseContainsNotNUllProductPrise() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.productPrise)
        }
    }


    // Check the Response Json response containts has valid product prise
    func testCheckThatResponseHasValidProductPrise() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(jsonFile:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.productPrise?.priseNow == "449.00")
        }
    }
}





