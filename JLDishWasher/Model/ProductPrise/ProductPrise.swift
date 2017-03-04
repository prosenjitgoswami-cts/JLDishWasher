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

    required init(productPrise: [String: Any]?) {
        super.init()
        dindProductPriseResult(productPrise: productPrise)
    }

}

//MARK:------------------------------- * ----------------------------------
//MARK: Data Bind Method
extension ProductPrise {

    func dindProductPriseResult(productPrise: [String: Any]?) {

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
