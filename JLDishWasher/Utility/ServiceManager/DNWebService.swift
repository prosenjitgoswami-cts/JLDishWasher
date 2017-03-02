//
//  DNWebService.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//
import Foundation

class DNWebService:BaseDataService {
    var postBodyString:String?
    var url:String

    init(urlString:String) {
        url = urlString
    }
    override func excecute(onSuccess:@escaping DataServiceSuccess, onFailure: @escaping DataServiceFailure) {
    
        
        let session = URLSession.shared
        
        guard let urlPath = URL(string: url) else {
            // TODO SOM
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

class ConnectionManager: URLSession {

    class func requestWithURLString(urlString: String?,
                                    failed: @escaping (Error) -> Void,
                                    successBlock: @escaping (Dictionary<String, Any>?)->Void) -> Void{

        // Set up the URL request
        let  endpointURLString: String? = urlString
        guard let url = URL(string: endpointURLString!) else {
            //Error: cannot create URL
            failed(ErrorManager.errorNilURlString())
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
                return
            }
            // make sure we got data
            guard let responseData = data else {
                failed(ErrorManager.errorNilResponse())

                return
            }
            // Parse the result as JSON, since that's what the API provides
            do {
                guard let  result = try JSONSerialization.jsonObject(with: responseData, options: []) as? [String: AnyObject] else {
                    //Error trying to convert data to JSON"
                    failed(ErrorManager.errorNilResponse())
                    return
                }
                // now we have the  , let's just print it to prove we can access it
                successBlock (result)
                
            } catch  {
                //Error trying to convert data to JSON"
                failed(ErrorManager.errorNilResponse())
                return
            }
        }
        
        task.resume()
    }
    
}

