//
//  Attribute.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class Attribute: NSObject {

    var specificProductName: String?
    var specificProductvalue: String?

    required init(attribute result: [String:Any]?) {
        super.init()
        guard let result = result else{
            return;
        }
        if let specificProductNameStr: String = result[kDictName] as? String {
            specificProductName = specificProductNameStr
        }

        if let specificProductValStr: String = result[kDictValue] as? String {
            specificProductvalue = specificProductValStr
        }
    }
}
