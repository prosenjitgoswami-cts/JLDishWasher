//
//  ProductPrise.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class ProductPrise: BaseModel {

    var priseNow : String?
    var priseCurrency : String?

    func initWith(productPrise: Dictionary<String, Any>?) {

		guard let productPrise = productPrise else {
			return;
		}

        if let priseNow = productPrise[kDictPriseNow] as? String {

            self.priseNow = priseNow
        }

        if let priseNow = productPrise[kDictpriseCurrency] as? String {
            
            self.priseCurrency = priseNow
        }
    }
}
