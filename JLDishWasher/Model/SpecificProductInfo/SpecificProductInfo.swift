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

		bindMedia(with: response)
	}
}

//MARK:------------------------------- * ----------------------------------
extension SpecificProductInfo {

 func bindMedia(with mediaResult:Dictionary<String, Any>?) {

	let media: Media = Media()
	media.initWith(response: mediaResult)

	}

	func bindDetails(with detailsResult:Dictionary<String, Any>?) {

		let media: Media = Media()
		media.initWith(response: detailsResult)
		
	}
}
