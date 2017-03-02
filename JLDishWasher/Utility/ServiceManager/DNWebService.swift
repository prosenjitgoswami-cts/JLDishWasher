//
//  DNWebService.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//
import Foundation

//MARK:------------------------------- * ----------------------------------
//MARK: DNWebService Class
class DNWebService:BaseDataService {
	var postBodyString:String?
	var url:String

	init(urlString:String) {
		url = urlString
	}
	override func excecute(onSuccess:@escaping DataServiceSuccess, onFailure: @escaping DataServiceFailure) {


		let session = URLSession.shared

		guard let urlPath = URL(string: url) else {
			onFailure(nil)
			return
		}

		var request = URLRequest(url: urlPath)
		request.timeoutInterval = 60
		request.addValue("application/json; charset=utf-8", forHTTPHeaderField: "Content-Type")

		if let postBody = postBodyString, let postBodyData = postBody.data(using: String.Encoding.utf8) {
			request.setValue(String(postBody.lengthOfBytes(using: String.Encoding.utf8)), forHTTPHeaderField:"Content-Length")
			request.httpBody = postBodyData
			request.httpMethod = "POST"
		}

		func completionHandler(data:Data?, response:URLResponse?, error:Error?)->Void {
			if let data_ = data {
				let responseData = ResponseData()
				do {
					let jsonObj = try  JSONSerialization.jsonObject(with: data_, options: JSONSerialization.ReadingOptions.allowFragments)

					responseData.contentData = jsonObj
					onSuccess(responseData)
				}
				catch {
					onFailure(error)
				}
			}
			else {
				onFailure(error)
			}
		}
		let dataTask = session.dataTask(with: request, completionHandler: completionHandler)
		dataTask.resume()

	}
}


//MARK:------------------------------- * ----------------------------------
//MARK: ConnectionManager Class
class ConnectionManager: URLSession {

	class func requestWithURLString(urlString: String?,
	                                failed: @escaping (Error) -> Void,
	                                successBlock: @escaping ([String: Any]?)->Void) -> Void{

		// Set up the URL request
		let  endpointURLString: String? = urlString
		guard let url = URL(string: endpointURLString!) else {
			//Error: cannot create URL
			ConnectionManager.errThrowWithFailed(failed: ErrorManager.errorNilURlString(), failedBlock: failed)

			return
		}
		let urlRequest = URLRequest(url: url)
		// set up the session
		let config = URLSessionConfiguration.default
		let session = URLSession(configuration: config)

		// make the request
		let task = session.dataTask(with: urlRequest) {
			(data, response, error) in
			// check for any errors
			guard error == nil else {
				failed(error!)
				ConnectionManager.errThrowWithFailed(failed: ErrorManager.errorNilResponse(), failedBlock: failed)

				return
			}
			// make sure we got data
			guard let responseData = data else {
				ConnectionManager.errThrowWithFailed(failed: ErrorManager.errorNilResponse(), failedBlock: failed)
				return
			}
			// Parse the result as JSON, since that's what the API provides
			do {
				guard let  result = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
					DispatchQueue.main.async {
						//Error trying to convert data to JSON"
						ConnectionManager.errThrowWithFailed(failed: ErrorManager.errorNilResponse(), failedBlock: failed)
					}

					return
				}
				// Return In Main Thread


				DispatchQueue.main.async {
					successBlock (result)
				}


			} catch  {
				//Error trying to convert data to JSON"

				ConnectionManager.errThrowWithFailed(failed: ErrorManager.errorNilResponse(), failedBlock: failed)
				return
			}
		}

		task.resume()
	}

}

//MARK:------------------------------- * ----------------------------------
//MARK: Private Method
extension ConnectionManager {

	/**
	Errer return in Main Thread
	Note: Here We may update UI or Show Alert. So It returns in main Thread
	@param failed: Error in (failed)
	@param failedBlock: Failed Block
	*/
	class func errThrowWithFailed(failed: NSError, failedBlock: @escaping (Error) -> Void) {

		if Thread.isMainThread {

			failedBlock(failed)

		} else {
			DispatchQueue.main.async {
				failedBlock(failed)
				
			}
		}
	}
}


