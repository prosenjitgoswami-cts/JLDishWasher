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

	public func initWith(response: Dictionary<String, Any>?) {

		guard let response = response else{
			return;
		}

		if let details: Dictionary = response[kDictDetails] as! Dictionary<String, Any>? {

			if let productInfo: String = details[kDictProductInfo] as! String? {
				productInformation = productInfo
			}

		}
	}
}
