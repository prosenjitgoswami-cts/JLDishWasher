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
                    imageURLStrings = urls
                }
			}
	}
}
