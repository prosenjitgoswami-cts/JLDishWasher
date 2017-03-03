//
//  UtilityTestCases.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 03/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import XCTest

class UtilityTestCases: XCTestCase {

    func testThatAddHTTPSAndColonWhenStringdoesNotContainsHTTPSAndColon() {
        let urlUithOutHttps = "//testurl.com"
        XCTAssertEqual(urlUithOutHttps.addHTTPSAndColonPrefixIfNotExits(), "https://testurl.com")
    }

    func testThatReturnSameURLWhenStringdoesContainsHTTPSAndColon() {
        let urlUithOutHttps = "https://testurl.com"
        XCTAssertEqual(urlUithOutHttps.addHTTPSAndColonPrefixIfNotExits(), "https://testurl.com")
    }


    func testThatAddHTTPSAndColonWhenStringdoesContainsHTTP() {
        let urlUithOutHttps = "http://testurl.com"
        XCTAssertEqual(urlUithOutHttps.addHTTPSAndColonPrefixIfNotExits(), "https://testurl.com")
    }

}
