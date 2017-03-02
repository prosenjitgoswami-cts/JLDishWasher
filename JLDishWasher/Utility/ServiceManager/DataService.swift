//
//  DataService.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//
import Foundation

typealias DataServiceSuccess = (_ response: ResponseData)->Void
typealias DataServiceFailure = (_ error:Error?)->Void

class ResponseData {
    var contentData:Any?
}

class BaseDataService {
    
    func excecute( onSuccess:@escaping DataServiceSuccess, onFailure:@escaping DataServiceFailure) {
        
    }
}
