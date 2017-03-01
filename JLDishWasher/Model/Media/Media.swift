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
}

//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension Media {

	public func initWith(response: Dictionary<String, Any>?) {

		guard let response = response else{
			return;
		}

		if let media: Dictionary = response[kDictMedia] as! Dictionary<String, Any>? {

			if let images: Dictionary = media[kDictImages] as! Dictionary<String, Any>? {

				var urls = [String]()

				for (key, value) in images {
					urls.append("\(key) \(value)")
				}

				imageURLStrings = urls;
			}
		}
	}
}
