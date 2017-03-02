//
//  JLDWProductGridViewControllerPresenter.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductGridViewControllerPresenter: NSObject {
    /**
     Fetch Product Details
     @param Success: It return Collection of Product
     @param failed: It is treturn failed
     */
    public func fetchProductList(failed: @escaping (Error) -> Void, success: @escaping ([Product]?) -> Void) {

        ConnectionManager.requestWithURLString(urlString: kURLStringProductList, failed: { (error) in

        }) { (response) in

            guard let _response = response else{
                failed (ErrorManager.errorNilResponse())
                return
            }
            if let products : [NSDictionary] = _response[kDictProducts] as? [NSDictionary] {
                let productsResults = self.perseResponseAndBind(results: products)
                success (productsResults)
            }
        }
    }

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



