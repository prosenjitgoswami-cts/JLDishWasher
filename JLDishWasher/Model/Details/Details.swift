//
//  Details.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class Details: BaseModel {

	var feature : Feature?
	var productInformation: String?
}

//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension Details {

	public func initWith(details result: Dictionary<String, Any>?) {

		guard let result = result else{
			return;
		}

			if let productInfo: String = result[kDictProductInfo] as? String {
				productInformation = productInfo
			}
	}
}
