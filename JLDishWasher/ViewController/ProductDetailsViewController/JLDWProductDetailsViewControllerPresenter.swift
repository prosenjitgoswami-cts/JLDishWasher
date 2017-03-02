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
	Perse the Json Response Result
	@param results: Server Response
	@retutn Return Collection of SpecificProductInfo
	*/
	public func perseResponseAndBind(withResults results: [NSDictionary]?) -> [SpecificProductInfo]? {

		var specificProductInfos : [SpecificProductInfo];

		if let results = results {

			guard results.count > 0 else {

				return nil;
			}
			specificProductInfos  = [SpecificProductInfo] ()

			for productInfo: NSDictionary? in results {

				if let productInfo = productInfo {
					if productInfo.count > 0 {
						 let specificProductInfo =  SpecificProductInfo(product: productInfo as? [String: Any])
						specificProductInfos.append(specificProductInfo)
                    } else {
                        return nil
                    }
                } else  {
                    return specificProductInfos
                }
			}

			return specificProductInfos
		}

		return nil
	}
}
