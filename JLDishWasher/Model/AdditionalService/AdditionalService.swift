//
//  AdditionalService.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class AdditionalService: BaseModel {

    var includedServices:[IncludedService]?
}
//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension AdditionalService {

    public func initWith(additionalService result: Dictionary<String, Any>?) {

        guard let result = result else{
            return;
        }
        bindIncludedServices(includedServices: result)
    }
}

//MARK:------------------------------- * ----------------------------------
extension AdditionalService {

    func bindIncludedServices(includedServices results:Dictionary<String, Any>?) {

        if let services  = results?[kDictIncludedServices] as? [String] {
            includedServices = [IncludedService]()

            for service in services {
                let service: String? = service
                if let service = service {
                let includedService = IncludedService()
                includedService.initWith(includedServices: service)
                includedServices?.append(includedService)
                }
            }

        }
    }
}
