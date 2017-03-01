//
//  SpecificProductInfo.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class SpecificProductInfo: Product {

	var media: Media?
	var details: Details?
	var displaySpecialOffer :String?


}

//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension SpecificProductInfo {

	public func initWith(response: Dictionary<String, Any>?) {

		guard let response = response else{
			return;
		}
		super.initWithResponse(response: response)

		if let displaySpecialOfferStr = response[kDictDisplaySpecialOffer] as! String? {

			displaySpecialOffer = displaySpecialOfferStr;
		}
	}
}

//MARK:------------------------------- * ----------------------------------
//MARK: Private Method
extension SpecificProductInfo {

private func bindMedia(with media:Dictionary<String, Any>?) {


	}
}
