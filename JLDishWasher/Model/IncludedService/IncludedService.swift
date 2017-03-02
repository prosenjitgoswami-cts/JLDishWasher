//
//  IncludedService.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class IncludedService: BaseModel {

    var guaranteeinfo: String?

    required init(includedServices result: String?) {
        super.init()
        bindIncludedServicesResult(includedServices: result)
    }

}
//MARK:------------------------------- * ----------------------------------
//MARK: Bind Data Method
extension IncludedService {

    public func bindIncludedServicesResult(includedServices result: String?) {

        guard let result = result else{
            return;
        }
        self.guaranteeinfo = result

    }
}
