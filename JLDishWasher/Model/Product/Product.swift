//
//  Product.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class Product: NSObject {

    var productId: String?
    var title: String?
    var imageURLString: String?
    var productPrise: ProductPrise?
    var prise: String?

    public func initWithResponse(response: Dictionary<String, Any>?) {

        if let response = response {

            productId = response[kDictProductId] as! String?
            title = response[kDictTitle] as! String?
            imageURLString = response[kDictImageURLString] as! String?

            if let dictPrice = response[kDictPrice] as! Dictionary<String, Any?>?{
                perseProductPriseWith(price: dictPrice)
            }
        }
    }


    private func perseProductPriseWith(price: Dictionary<String, Any>){
        productPrise = ProductPrise();
        productPrise?.initWith(productPrise: price)
        
    }
}
