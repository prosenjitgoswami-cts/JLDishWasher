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

    lazy var presenter: JLDWProductGridViewControllerPresenter = {
        return JLDWProductGridViewControllerPresenter()
    }()

    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Response Validation
    // Check the Response Json response is valid
    func testCheckThatResponseContainsValidResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWith21Products) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            XCTAssertTrue(productLists.count > 0)
        }
    }

    // Check the Response Json containts Max 20 results
    func testJsonFileForProductsListWithMax20Products() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWith21Products) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)
            XCTAssertTrue(productLists.count == 20)
        }
    }


    // Check the Response Json response is nil
    func testCheckThatResponseContainsNilResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            XCTAssertTrue(productLists.count ==  0)
        }
    }

    // Check the Response Json response is valid Product DataModel
    func testCheckThatResponseContainsValidProductDataModel() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product)
        }
    }
    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Product ID
    // Check the Response Json response containts not null product id

    // Check the Response Json response has invalid product id
    func testCheckThatResponseHasInValidProductId() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNil(product?.productId)
        }
    }

    func testCheckThatResponseContainsNotNUllProductId() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.productId)
        }
    }

    // Check the Response Json response has  product id
    func testCheckThatResponseHasValidProductId() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.productId == "1913470")
        }
    }

    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Title

    // Check the Response Json response has  product id
    func testCheckThatResponseHasValidTitle() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.title == "Bosch SMV53M40GB Fully Integrated Dishwasher")
        }
    }

    // Check the Response Json response has invalid Title
    func testCheckThatResponseHasInValidTitle() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNil(product?.title)
        }
    }

    // Check the Response Json response containts not null title
    func testCheckThatResponseContainsNotNUllTitle() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.title)
        }
    }

    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For ImageURLString

    // Check the Response Json response containts not null imageURLString
    func testCheckThatResponseContainsNotNUllImageURLString() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.imageURLString)
        }
    }

    // Check the Response Json response has invalid imageURLString
    func testCheckThatResponseHasInValidImageURLString() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNil(product?.imageURLString)
        }
    }


    // Check the Response Json response has  imageURLString
    func testCheckThatResponseHasValidImageURLString() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.imageURLString == "//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
        }
    }
    //MARK:------------------------------- * ----------------------------------
    // Check the Response Json response containts not null ProductPrise Result

    // Check the Response Json response has invalid productPrise result
    func testCheckThatResponseHasInValidProductPriseResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNil(product?.productPrise)
        }
    }


    func testCheckThatResponseContainsNotNUllProductPriseResult() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNotNil(product?.productPrise)
        }
    }

    // Check the Response Json response containts has valid product prise
    func testCheckThatResponseHasValidProductPrise() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.productPrise?.priseNow == "449.00")
        }
    }

    // Check the Response Json response containts has valid product prise
    func testCheckThatResponseHasValidProductPrisewithPriseSymBol() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithValidProducts) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertTrue(product?.priseDisplayString == "£449.00")
        }
    }

    // Check the Response Json response has invalid productPrise result
    func testCheckThatResponseHasInValidProductPriseWthPriseSymBol() {

        if let products : [NSDictionary] = JLDWTestUtility.fetchJSONFromTestJsonFile(withJSONFileName:TestJsonFileForProductsListWithNoProduct) {

            let productLists: [Product] = self.presenter.perseResponseAndBind(results: products)

            let product: Product? = productLists[0]
            XCTAssertNil(product?.priseDisplayString)
        }
    }


}





