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

    required init(product response: [String: Any]?) {
    super.init()
        bindWithProductResult(product: response)
    }

}

//MARK:------------------------------- * ----------------------------------
//MARK: Data Bind Method

extension Product {

    public func bindWithProductResult(product response: [String: Any]?) {

        if let response = response {

            productId = response[kDictProductId] as? String
            title = response[kDictTitle] as? String
            imageURLString = response[kDictImageURLString] as? String

            if let dictPrice = response[kDictPrice] as? [String: Any]{
                bindWith(priceDetails: dictPrice)
            }
        }
    }

    /**
     Perse product prise response and Bind with model
     @param  priceDetails: It product prise details Dictionary
     */
    private func bindWith(priceDetails: [String: Any]){
        productPrise = ProductPrise(productPrise: priceDetails)
        if let productPrise = productPrise?.priseNow {
            self.priseDisplayString  = "£" + productPrise
        }
    }
}
