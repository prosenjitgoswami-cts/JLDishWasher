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
    required init(additionalService result: [String: Any]?) {
        super.init()
        dataBindWith(additionalService: result)
    }
}
//MARK:------------------------------- * ----------------------------------
//MARK: Data Bind Method
extension AdditionalService {

    public func dataBindWith(additionalService result: [String: Any]?) {

        guard let result = result else{
            return;
        }
        bindIncludedServices(includedServices: result)
    }
    
    func bindIncludedServices(includedServices results:[String: Any]?) {

        if let services  = results?[kDictIncludedServices] as? [String] {
            includedServices = [IncludedService]()

            for service in services {
                let service: String? = service
                if let service = service {
                let includedService = IncludedService(includedServices: service)
                includedServices?.append(includedService)
                }
            }

        }
    }
}
