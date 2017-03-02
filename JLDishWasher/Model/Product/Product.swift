//
//  Product.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

class Product: BaseModel {

	var productId: String?
	var title: String?
	var imageURLString: String?
	var productPrise: ProductPrise?
	var priseDisplayString: String?

	public func initWithResponse(response: Dictionary<String, Any>?) {

		if let response = response {

			productId = response[kDictProductId] as? String
			title = response[kDictTitle] as? String
			imageURLString = response[kDictImageURLString] as? String

			if let dictPrice = response[kDictPrice] as? Dictionary<String, Any>{
				perseProductPriseWith(priceDetails: dictPrice)
			}
		}
	}

	/**
	Perse product prise response and Bind with model
	@param  priceDetails: It product prise details Dictionary
	*/
	private func perseProductPriseWith(priceDetails: Dictionary<String, Any>){
		productPrise = ProductPrise();
		productPrise?.initWith(productPrise: priceDetails)
		if let productPrise = productPrise?.priseNow {
			self.priseDisplayString  = "£" + productPrise
		}
	}
}
