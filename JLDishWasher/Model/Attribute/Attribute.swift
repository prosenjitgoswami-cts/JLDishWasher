//
//  Attribute.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class Attribute: NSObject {

    var attributeName: String?
    var attributeValue: String?

    required init(attribute result: [String:Any]?) {
        super.init()
        guard let result = result else{
            return;
        }
        if let attributeNameStr: String = result[kDictName] as? String {
            attributeName = attributeNameStr
        }

        if let specificProductValStr: String = result[kDictValue] as? String {
            attributeValue = specificProductValStr
        }
    }
}
