//
//  JLDWProductDetailsVCTests.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import XCTest

let TestJsonFileForProductPage = "TestJsonForProductPage"
let TestJsonFileForProductPageNoProductInfo = "TestJsonForProductPageNoProductInfo"


class JLDWProductDetailsVCTests: XCTestCase {

	lazy var presenter: JLDWProductDetailsViewControllerPresenter = {
		return JLDWProductDetailsViewControllerPresenter()
	}()



	//MARK:------------------------------- * ----------------------------------
	//MARK: Test Cases For Response Validation
	// Check the Response Json response is valid
	func testCheckThatResponseContainsValidResult() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		XCTAssertNotNil(specificProductInfos)
	}

	// Check the Response Json response is nil
	func testCheckThatResponseContainsNilResult() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
		XCTAssertNil(specificProductInfos)
	}

	//MARK:------------------------------- * ----------------------------------
	//MARK: Test Cases For Product ID

	// Check the Response Json response has not contained product id
	func testCheckThatResponseHasNotContainedProductId() {

			let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
			let product: SpecificProductInfo? = specificProductInfos?[0]
			XCTAssertNil(product?.productId)
		}

	func testCheckThatResponseHasContainsProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let product: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotNil(product?.productId)
	}

	// Check the Response Json response has contained valid product id
	func testCheckThatResponseHasContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let product: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertEqual(product?.productId, "1913470")
	}

	// Check the Response Json response has not contained valid product id
	func testCheckThatResponseHasNotContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let product: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotEqual(product?.productId, "0000")
	}
    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Title
    func testCheckThatResponseHasNotContainedTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let product: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(product?.title)
    }

    func testCheckThatResponseHasContainsTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let product: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(product?.title)
    }

    // Check the Response Json response has contained valid product id
    func testCheckThatResponseHasContainedValidTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let product: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(product?.title, "Bosch SMV53M40GB Fully Integrated Dishwasher")
    }

    // Check the Response Json response has not contained valid product id
    func testCheckThatResponseHasNotContainedValidTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let product: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotEqual(product?.title, "NotContainedValidTitle")
    }

}

//MARK:------------------------------- * ----------------------------------
// Common Method
extension JLDWProductDetailsVCTests {

	public func productPageJsonResults () -> [SpecificProductInfo]? {

		let specificProductInfos : [NSDictionary]? = JLDWTestUtility.invokeJSONFromTestJsonFileForProductDetails(withJSONFileName: TestJsonFileForProductPage)

		let specificProductInfo: [SpecificProductInfo]? = self.presenter.perseResponseAndBind(withResults: specificProductInfos)

		return specificProductInfo

	}

	public func productPageJsonInvalidResults () -> [SpecificProductInfo]? {

		let specificProductInfos : [NSDictionary]? = JLDWTestUtility.invokeJSONFromTestJsonFileForProductDetails(withJSONFileName: TestJsonFileForProductPageNoProductInfo)

		let specificProductInfo: [SpecificProductInfo]? = self.presenter.perseResponseAndBind(withResults: specificProductInfos)

		return specificProductInfo
		
	}
	
}
