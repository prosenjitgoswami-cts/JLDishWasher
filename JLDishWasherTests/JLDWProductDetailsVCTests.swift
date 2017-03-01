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

		if let specificProductInfos : [NSDictionary] = JLDWTestUtility.invokeJSONFromTestJsonFileForProductDetails(withJSONFileName: TestJsonFileForProductPage) {

			let specificProductInfos: [SpecificProductInfo]? = self.presenter.perseResponseAndBind(withResults: specificProductInfos)

			XCTAssertNotNil(specificProductInfos)
		}
	}

	// Check the Response Json response is nil
	func testCheckThatResponseContainsNilResult() {

		if let specificProductInfos : [NSDictionary] = JLDWTestUtility.invokeJSONFromTestJsonFileForProductDetails(withJSONFileName: TestJsonFileForProductPageNoProductInfo) {

			let specificProductInfos: [SpecificProductInfo]? = self.presenter.perseResponseAndBind(withResults: specificProductInfos)

			XCTAssertNil(specificProductInfos)
		}
	}


}
