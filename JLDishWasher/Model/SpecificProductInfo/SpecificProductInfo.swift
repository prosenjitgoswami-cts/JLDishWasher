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
}

//MARK:------------------------------- * ----------------------------------
//MARK: Public Method
extension SpecificProductInfo {

    public func initWith(response: Dictionary<String, Any>?) {

        guard let response = response else{
            return;
        }
        super.initWithResponse(response: response)

        if let displaySpecialOfferStr = response[kDictDisplaySpecialOffer] as? String {
            displaySpecialOffer = displaySpecialOfferStr;
        }

        if let codeString = response[kDictCode] as? String {
            code = codeString;
        }

        bindMedia(with: response)
        bindDetails(with: response)
        bindAdditionalService(with: response)
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

}

//MARK:------------------------------- * ----------------------------------
// Dependency Binding
extension SpecificProductInfo {

    func bindMedia(with mediaResult:Dictionary<String, Any>?) {

        if let mediaResult: [String : Any] = mediaResult?[kDictMedia] as? [String:Any]{
            media = Media()
            media?.initWith(media: mediaResult)
        }
    }

    func bindDetails(with detailsResult:Dictionary<String, Any>?) {
        
        if let detailsResult: [String : Any] = detailsResult?[kDictDetails] as? [String:Any]{

            details = Details()
            details?.initWith(details: detailsResult)
        }
    }

    func bindAdditionalService(with additionalServiceResult:Dictionary<String, Any>?) {

        if let result: [String : Any] = additionalServiceResult?[kDictAdditionalServices] as? [String:Any]{

            additionalService = AdditionalService()
            additionalService?.initWith(additionalService: result)
        }
    }
}
