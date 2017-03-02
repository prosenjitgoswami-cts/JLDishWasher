//
//  Details.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class Details: BaseModel {

    var specificFeature : SpecificFeature?
    var productInformation: String?

    required init(details result: [String: Any]?) {
        super.init()
        bindData(details: result)
    }
}

//MARK:------------------------------- * ----------------------------------
//MARK: Delendency Binding Method
extension Details {


    public func bindData(details result: [String: Any]?) {

        guard let result = result else{
            return;
        }
        if let productInfo: String = result[kDictProductInfo] as? String {
            productInformation = productInfo
        }

        bindAdditionalSpecificFeature(with: result)
    }


    func bindAdditionalSpecificFeature(with result:[String:Any]?) {


        if let spFeatures = result?[kDictFeature] as? [[String:Any]] {

            let firstFeature  = spFeatures[0]

            if let attributes = firstFeature[kDictAttributes] as? [String:Any] {
                specificFeature = SpecificFeature(specificFeature: attributes)
            }
        }
    }
    
}
