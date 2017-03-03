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
public extension UIImageView {
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

public extension DispatchQueue {

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

//MARK:------------------------------- * ----------------------------------
//MARK: String HelperUtils
public extension String {

	/* Add Prefix
	@param string Prefix string
	@return string with prefix
	*/
	public func addPrefix(with string: String) -> String? {
		var imageURLStringWithHTTPS: String = string
		imageURLStringWithHTTPS.append(self);
		return imageURLStringWithHTTPS
	}
	/* add HTTPS And Colon Prefix
	@param string Prefix string
	@return string with prefix with https
	*/
	public func addHTTPSAndColonPrefix() -> String? {
		return addPrefix(with: "https:")
	}

	/*
	Add Prefix https when does not exits or Having http:
	*/
	public func addHTTPSAndColonPrefixIfNotExits() -> String? {

		let httpsString = "https:"
		let httpString = "http:"

		if self.lowercased().range(of:httpsString) != nil {
			return self

		} else if self.lowercased().range(of:httpString) != nil {
			return self.replacingOccurrences(of: httpString, with: httpsString)
		} else {

			return self.addHTTPSAndColonPrefix()
		}
	}

	public func removeHTMLTagsInString () -> String?{

		let removedHTMLTagsInString = self.replacingOccurrences(of:"<[^>]+>", with: "", options: .regularExpression, range: nil)
		return removedHTMLTagsInString
	}
}

//MARK:------------------------------- * ----------------------------------
//MARK: UIAlertController Helper Utils
public extension UIViewController {

	/*
	show alert 
	*/
	public func showAlert(with title: String?, message: String?, defaultButtonTitle: String?, cancelButtonTitle: String?, defaultButtonHandler: @escaping (UIAlertAction!) -> Void, cancelButtonHandler: @escaping (UIAlertAction!) -> Void) {

		let alertController = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)

		if let defaultButtonTitle = defaultButtonTitle {
			alertController.addAction(UIAlertAction(title: defaultButtonTitle, style: .default, handler: { (action: UIAlertAction!) in

				defaultButtonHandler(action)
			}))
		}

		if let cancelButtonTitle = cancelButtonTitle {
			alertController.addAction(UIAlertAction(title: cancelButtonTitle, style: .cancel, handler: { (action: UIAlertAction!) in

				cancelButtonHandler(action)

			}))
		}

		self.present(alertController, animated: true) {
		}
	}

	/*
	show alert with title, message, OK button
	*/
	public func showAlert(with title: String?, message: String?) {

		self.showAlert(with: title, message: message, defaultButtonTitle: AltBtnTitleOK, cancelButtonTitle: nil,  defaultButtonHandler: { action in
		}, cancelButtonHandler: { action in
		})
	}

	/*
	show alert on offline
	*/
	public func showAlertOnNoInternetConnection() {

		showAlert(with: AltTitleEmpty, message: ALTMessageNetworkConnection)
	}

	/*
	show alert on error
	*/
	public func showAlertOnError() {

		showAlert(with: AltTitleError, message: ALTMessageError)

	}

}

