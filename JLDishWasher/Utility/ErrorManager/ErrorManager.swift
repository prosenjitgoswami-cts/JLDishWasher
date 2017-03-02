//
//  ErrorManager.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import Foundation


class ErrorManager: NSError {


	class func errorNilResponse() -> NSError {

		let err = NSError.init(domain: kErrorDomain, code:ErrorManagerErrorCode.NilResponseData.rawValue, userInfo: nil)

		return err
	}

	class func errorNilURlString() -> NSError {

		let err = NSError.init(domain: kErrorDomain, code:ErrorManagerErrorCode.NilURLString.rawValue, userInfo: nil)

		return err
	}

}
