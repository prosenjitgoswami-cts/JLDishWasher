//
//  HelperUtils.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import Foundation
import UIKit

//MARK:------------------------------- * ----------------------------------
//MARK: UIImageView HelperUtils
extension UIImageView {
	public func imageFromServerURL(urlString: String) {


		DispatchQueue.background(delay:0.3, background: {

			URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in
				if error != nil {
					return
				}
				DispatchQueue.main.async(execute: { () -> Void in
					let image = UIImage(data: data!)
					self.image = image
				})

			}).resume()

		}) { 
//
		}

	}
}

//MARK:------------------------------- * ----------------------------------
//MARK: DispatchQueue HelperUtils

extension DispatchQueue {

	static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
		DispatchQueue.global(qos: .background).async {
			background?()
			if let completion = completion {
				DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
					completion()
				})
			}
		}
	}

}
