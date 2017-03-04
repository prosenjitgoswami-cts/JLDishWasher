//
//  Details.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class Details: BaseModel {

    var attributes : [Attribute]?
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

        bindAdditionalAttribute(attributes: result)
    }


    func bindAdditionalAttribute(attributes result:[String:Any]?) {

        if let features = result?[kDictFeature] as? [[String:Any]] {

            let first:Dictionary = features[0]
            let attrResults: [[String:Any]] = first[kDictAttributes] as! [[String : Any]]

            attributes = [Attribute]()

            for attribute in attrResults {

                let attribute = Attribute(attribute: attribute)
                attributes?.append(attribute)
                }
            }
            }
        }


