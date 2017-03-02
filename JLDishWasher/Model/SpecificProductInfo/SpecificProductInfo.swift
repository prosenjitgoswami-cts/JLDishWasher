//
//  SpecificProductInfo.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


class SpecificProductInfo: Product {

    var media: Media?
    var details: Details?
    var displaySpecialOffer :String?
    var code :String?
    var guaranteeInformation: String?
    var productInformation: String?
    var additionalService: AdditionalService?

    required init(product response: [String : Any]?) {
        super.init(product: response)
        dataBindWith(response: response)    }
}

//MARK:------------------------------- * ----------------------------------
//MARK: Data Bind Method

extension SpecificProductInfo {

    public func dataBindWith(response: [String: Any]?) {

        guard let response = response else{
            return;
        }
        if let displaySpecialOfferStr = response[kDictDisplaySpecialOffer] as? String {
            displaySpecialOffer = displaySpecialOfferStr;
        }

        if let codeString = response[kDictCode] as? String {
            code = codeString;
        }

        bindMediaResult(with: response)
        bindDetailsResult(with: response)
        bindAdditionalServiceResult(with: response)
        getGuaranteeInformation()
        getProductInformation()

    }

    func getGuaranteeInformation() {

        if let guaranteeInfo = additionalService?.includedServices?[0].guaranteeinfo {
            guaranteeInformation = guaranteeInfo
        }
    }

    func getProductInformation() {

        if let productInfo = details?.productInformation {
            productInformation = productInfo
        }
    }

    func bindMediaResult(with mediaResult:[String: Any]?) {

        if let mediaResult: [String : Any] = mediaResult?[kDictMedia] as? [String:Any]{
            media = Media(media: mediaResult)
        }
    }

    func bindDetailsResult(with detailsResult:[String: Any]?) {
        
        if let detailsResult: [String : Any] = detailsResult?[kDictDetails] as? [String:Any]{

            details = Details(details: detailsResult)
        }
    }

    func bindAdditionalServiceResult(with additionalServiceResult:[String: Any]?) {

        if let result: [String : Any] = additionalServiceResult?[kDictAdditionalServices] as? [String:Any]{

            additionalService = AdditionalService(additionalService: result)
        }
    }

    
}
