//
//  JLDWProductDetailsViewControllerPresenter.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewControllerPresenter: NSObject {

    /**
     URLStringProductPage
     @param withPeroductID: withPeroductID is ProductID
     @return End point URL for URLStringProductPage
     */
    public func getEndPointURLStringForProductPage(withPeroductID peroductID: String?) -> String? {
        if let peroductID = peroductID {
            let urlPart1 = "https://api.johnlewis.com/v1/products/"
            let urlPart2 = "?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
            let endPointURLString = urlPart1 + peroductID + urlPart2
            return endPointURLString
        }
        return nil;
    }
    /**
     Fetch Product Details
     @param Success: It return Collection of Product
     @param failed: It is treturn failed
     */
    public func fetchProductDetails(withProducetID: String?, failed: @escaping (Error) -> Void, success: @escaping ([SpecificProductInfo]?) -> Void) {

        let endPointURLString  = getEndPointURLStringForProductPage(withPeroductID: withProducetID);

        if let endPointURLString = endPointURLString {

            ConnectionManager.requestWithURLString(urlString: endPointURLString, failed: { (error) in
				failed (error)
            }) { (response) in

                guard let _response = response else{
                    failed (ErrorManager.errorNilResponse())
                    return
                }
                let productsResults = self.perseResponseAndBind(withResults: _response)
                success (productsResults)
            }
        }
    }

    /**
     Perse the Json Response Result
     @param results: Server Response
     @retutn Return Collection of SpecificProductInfo
     */
    public func perseResponseAndBind(withResults results: [String: Any]?) -> [SpecificProductInfo]? {

        var specificProductInfos : [SpecificProductInfo];

        if let results = results {

            guard results.count > 0 else {

                return nil;
            }
            specificProductInfos  = [SpecificProductInfo] ()

            if results.count > 0 {

                let specificProductInfo =  SpecificProductInfo(product: results)
                        specificProductInfos.append(specificProductInfo)
                    } else {
                        return nil
                    }
            return specificProductInfos
        }
        
        return nil
    }
}
