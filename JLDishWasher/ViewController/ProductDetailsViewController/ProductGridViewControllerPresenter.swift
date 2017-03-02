//
//  ProductGridViewControllerPresenter.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class ProductGridViewControllerPresenter: NSObject {

    public func fet_chProductList(failed: @escaping (Error) -> Void, success: @escaping ([Product]?) -> Void) {
        if let path = Bundle.main.path(forResource: "TestJSON", ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let products : [NSDictionary] = jsonResult[kDictProducts] as? [NSDictionary] {

                        let productsResults = perseResponseAndBind(results: products)

                        success (productsResults)

                    }
                } catch {}
            } catch {}
        }
    }

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
        for product: NSDictionary in results {
            let  productDetails =  Product()
            productDetails.initWithResponse(response: product as? Dictionary<String, Any>)
            products.append(productDetails)
        }
        return products
    }
}
