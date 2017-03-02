//
//  JLDWTestUtility.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWTestUtility: NSObject {

    class func fetchJSONFromTestJsonFile(jsonFile: String?) -> [NSDictionary]? {
        if let path = Bundle.main.path(forResource: jsonFile, ofType: "json") {
            do {
                let jsonData = try NSData(contentsOfFile: path, options: NSData.ReadingOptions.mappedIfSafe)
                do {
                    let jsonResult: NSDictionary = try JSONSerialization.jsonObject(with: jsonData as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! NSDictionary
                    if let products : [NSDictionary] = jsonResult[kDictProducts] as? [NSDictionary] {
                        return products;
                    }
                } catch {

                    return nil;

                }
            } catch {

                return nil;
            }
        }
        
        return nil;
    }
}
