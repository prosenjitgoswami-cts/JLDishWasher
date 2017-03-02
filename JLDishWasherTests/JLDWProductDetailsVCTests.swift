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
	// Check the response is valid
	func testCheckThatResponseContainsValidResult() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		XCTAssertNotNil(specificProductInfos)
	}

	// Check the response is nil
	func testCheckThatResponseContainsNilResult() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
		XCTAssertNil(specificProductInfos)
	}

	//MARK:------------------------------- * ----------------------------------
	//MARK: Test Cases For Product ID

	// Test the response has not contained product id
	func testCheckThatResponseHasNotContainedProductId() {

			let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
			let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
			XCTAssertNil(specificProductInfo?.productId)
		}

    // Test the response has contained product id
	func testCheckThatResponseHasContainsProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotNil(specificProductInfo?.productId)
	}

	// Test the response has contained valid product id
	func testCheckThatResponseHasContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertEqual(specificProductInfo?.productId, "1913470")
	}

	// Test the response has not contained valid product id
	func testCheckThatResponseHasNotContainedValidProductId() {

		let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
		let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
		XCTAssertNotEqual(specificProductInfo?.productId, "0000")
	}
    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Title

    // Test the response has not contained title
    func testCheckThatResponseHasNotContainedTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.title)
    }

    // Test the response has contained valid title

    func testCheckThatResponseHasContainsTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.title)
    }

    // Test the response has contained valid title
    func testCheckThatResponseHasContainedValidTitle() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(specificProductInfo?.title, "Bosch SMV53M40GB Fully Integrated Dishwasher")
    }

    // Test the response has not contained valid title
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

    // Test the response has not contained Media
    func testCheckThatResponseHasNotContainedMedia() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.media)
    }

    // Test the response has contained valid Media

    func testCheckThatResponseHasContainsMedia() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.media)
    }

    // Test the response has contained valid Media image URL strings
    func testCheckThatResponseHasContainsMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.media?.imageURLStrings)
    }

    // Test the response has contained valid Media image URL strings
    func testCheckThatResponseHasNotContainsMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.media?.imageURLStrings)
    }

    // Test the response has contained valid number Media image URL strings
    func testCheckThatResponseHasContainsValidNumberMediaImageURLStrings() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertTrue (specificProductInfo?.media?.imageURLStrings?.count == 6)
    }

    // Test the response has contained valid number Media image URL strings
    func testCheckThatResponseHasContainsValidMediaImageURLStringsValue() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let firstURSStrings  = specificProductInfo?.media?.imageURLStrings?[0]
        XCTAssertEqual(firstURSStrings, "//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
    }

    // Test the response has contained in valid number Media image URL strings value
    func testCheckThatResponseHasContainsInValidMediaImageURLStringsValue() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let firstURSStrings  = specificProductInfo?.media?.imageURLStrings?[0]
        XCTAssertNotNil(firstURSStrings, "NA//johnlewis.scene7.com/is/image/JohnLewis/234326372?")
    }


    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Details

    // Test the response has not contained Details
    func testCheckThatResponseHasNotContainedDetails() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.details)
    }

    // Test the response has contained valid Media

    func testCheckThatResponseHasContainsDetails() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.details)
    }

    // Test the response has not contained productInformation
    func testCheckThatResponseHasNotContainedProductDetailsInformation() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.details?.productInformation)
    }

    // Test the response has contained valid Media

    func testCheckThatResponseHasContainedProductDetailsInformation() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.details?.productInformation)
    }
    
    // Test the response has contained valid details infomation
    func testCheckThatResponseHasContainsValidDetailsInfomation() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let productInformation  = specificProductInfo?.details?.productInformation
        XCTAssertEqual(productInformation, "<p>TestInfo</p>")
    }

    // Test the response has contained invalid details infomation
    func testCheckThatResponseHasContainsInValidDetailsInfomation() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        let productInformation  = specificProductInfo?.media?.imageURLStrings?[0]
        XCTAssertNotNil(productInformation, "NA")
    }


    //MARK:------------------------------- * ----------------------------------
    //MARK: Test Cases For Product Code

    // Test the response has not contained product code
    func testCheckThatResponseHasNotContainedProductCode() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonInvalidResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNil(specificProductInfo?.code)
    }

    // Test the response has contained product code

    func testCheckThatResponseHasContainsProductCode() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.code)
    }

    // Test the response has contained valid product code
    func testCheckThatResponseHasContainsValidProductCode() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertEqual(specificProductInfo?.code, "88701205")
    }

    // Test the response has contained invalid product code
    func testCheckThatResponseHasContainsInValidProductCode() {

        let specificProductInfos : [SpecificProductInfo]? = productPageJsonResults()
        let specificProductInfo: SpecificProductInfo? = specificProductInfos?[0]
        XCTAssertNotNil(specificProductInfo?.code, "NA")
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
