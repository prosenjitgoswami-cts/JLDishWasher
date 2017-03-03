//
//  Media.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class Media: BaseModel {

    var imageURLStrings: [String]?

    required init(media results: [String: Any]?) {
        super.init()
        bindMediaResultResult(media: results)
    }
}

//MARK:------------------------------- * ----------------------------------
//MARK: Bind Data
extension Media {
    public func bindMediaResultResult(media results: [String: Any]?) {
        guard let results = results else{
            return;
        }
        if let images = results[kDictImages] as? [String:Any] {
            if let urls  = images[kDictUrls] as? [String] {
                imageURLStrings = modifiedURLS(with: urls)
            }
        }
    }

    /*
     In the method idf the urls does not contains https, then its added
     @param urls: Its string collection of urls
     @return Its string collection of urls containg https

     */
    private func modifiedURLS(with urls:[String]) -> [String] {

        var modifiedUrls = [String]()
        for url in urls {
            if let modifiedUrl = url.addHTTPSAndColonPrefixIfNotExits() {
                modifiedUrls.append(modifiedUrl)
            }
        }
        return modifiedUrls
    }
}
