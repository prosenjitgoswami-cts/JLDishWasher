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

}
//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension IncludedService {

    public func initWith(includedServices result: String?) {

        guard let result = result else{
            return;
        }
        self.guaranteeinfo = result

    }
}
