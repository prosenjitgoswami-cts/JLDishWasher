//
//  ProductGridViewControllerPresenter.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class ProductGridViewControllerPresenter: NSObject {

    /**
     Perse the Json Response Result
     @param results: Server Response
     @retutn Return Collection of Product
     */
    public func perseResponseAndBind(results: [NSDictionary]) -> [Product] {

        var products : [Product] = [Product] ()

        var i = 0
        for product: NSDictionary in results {

            if i>=20 { break}

            let  productDetails =  Product()
            productDetails.initWithResponse(response: product as? Dictionary<String, Any>)
            products.append(productDetails)
            i += 1
        }
        return products
    }

}
