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

	// Test the Response Json response has not contained product id
	func testCheckThatResponseHasNotContainedProductId() {

			let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
			let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
			XCTAssertNil(specificProductInfo?.productId)
		}

    // Test the Response Json response has contained product id
	func testCheckThatResponseHasContainsProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotNil(specificProductInfo?.productId)
	}

	// Test the Response Json response has contained valid product id
	func testCheckThatResponseHasContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertEqual(specificProductInfo?.productId, "1913470")
	}

	// Test the Response Json response has not contained valid product id
	func testCheckThatResponseHasNotContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotEqual(specificProductInfo?.productId, "0000")
	}
    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Title

    // Test the Response Json response has not contained title
    func testCheckThatResponseHasNotContainedTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.title)
    }

    // Test the Response Json response has contained valid title

    func testCheckThatResponseHasContainsTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.title)
    }

    // Test the Response Json response has contained valid title
    func testCheckThatResponseHasContainedValidTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(specificProductInfo?.title, "Bosch SMV53M40GB Fully Integrated Dishwasher")
    }

    // Test the Response Json response has not contained valid title
    func testCheckThatResponseHasNotContainedValidTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotEqual(specificProductInfo?.title, "NotContainedValidTitle")
    }

    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Prise List

    //  Test that response has not contained productprise
    func testCheckThatResponseHasNotContainedProductPrise() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.productPrise)
    }

    //  Test that response has contained productprise
    func testCheckThatResponseHasContainedProductPrise() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.productPrise)
    }

    //  Test that response has contained valid PriseNow
    func testCheckThatResponseHasContainedValidProductPriseNow() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(specificProductInfo?.productPrise?.priseNow, "449.00")
    }

    //  Test that response has contained invalid PriseNow
    func testCheckThatResponseHasContainedInValidProductPriseNow() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotEqual(specificProductInfo?.productPrise?.priseNow, "NA")
    }


    //  Test that response has contained valid PriseNowDisplay String
    func testCheckThatResponseHasContainedValidProductPriseNowDisplayString() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(specificProductInfo?.priseDisplayString, "£449.00")
    }
    //  Test that response has contained invalid PriseNowDisplay String
    func testCheckThatResponseHasContainedInValidProductPriseNowDisplayString() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotEqual(specificProductInfo?.priseDisplayString, "£000.00")
    }

    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Media

    // Test the Response Json response has not contained Media
    func testCheckThatResponseHasNotContainedMedia() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.media)
    }

    // Test the Response Json response has contained valid Media

    func testCheckThatResponseHasContainsMedia() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.media)
    }

    // Test the Response Json response has contained valid Media image URL strings
    func testCheckThatResponseHasContainsMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.media?.imageURLStrings)
    }

    // Test the Response Json response has contained valid Media image URL strings
    func testCheckThatResponseHasNotContainsMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.media?.imageURLStrings)
    }

    // Test the Response Json response has contained valid number Media image URL strings
    func testCheckThatResponseHasContainsValidNumberMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertTrue (specificProductInfo?.media?.imageURLStrings?.count == 6)
    }

    // Test the Response Json response has contained valid number Media image URL strings
    func testCheckThatResponseHasContainsValidMediaImageURLStringsValue() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let firstURSStrings  = specificProductInfo?.media?.imageURLStrings?[0]
        XCTAssertEqual(firstURSStrings, "//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
    }

    // Test the Response Json response has contained in valid number Media image URL strings value
    func testCheckThatResponseHasContainsInValidMediaImageURLStringsValue() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let firstURSStrings  = specificProductInfo?.media?.imageURLStrings?[0]
        XCTAssertNotNil(firstURSStrings, "NA//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
    }


//    // Test the Response Json response has contained valid media
//    func testCheckThatResponseHasContainedValidTitle() {
//
//        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
//        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
//        XCTAssertEqual(specificProductInfo?.title, "Bosch SMV53M40GB Fully Integrated Dishwasher")
//    }
//
//    // Test the Response Json response has not contained valid title
//    func testCheckThatResponseHasNotContainedValidTitle() {
//
//        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
//        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
//        XCTAssertNotEqual(specificProductInfo?.title, "NotContainedValidTitle")
//    }
    

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
