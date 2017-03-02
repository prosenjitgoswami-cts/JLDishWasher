//
//  JLDWConstants.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


// Service URL
let kURLStringProductList = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"

public func URLStringProductPage(withPeroductID peroductID: String?) -> String? {
	if let peroductID = peroductID {
	let urlPart1 = "https://api.johnlewis.com/v1/products/"
	let urlPart2 = "?key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb"
	let endPointURLString = urlPart1 + peroductID + urlPart2
	return endPointURLString
	}
	return nil;
}

// Dictionary Key
let kDictProducts = "products"
let kDictProductId = "productId"
let kDictTitle = "title"
let kDictPrice = "price"
let kDictImageURLString = "image"
let kDictPriseNow = "now"
let kDictpriseCurrency = "currency"
let kDictDisplaySpecialOffer = "displaySpecialOffer"
let kDictMedia = "media"
let kDictImages = "images"
let kDictUrls = "urls"
let kDictDetails = "details"
let kDictProductInfo = "productInformation"
let kDictCode = "code"
let kDictAdditionalServices = "additionalServices"
let kDictIncludedServices = "includedServices"

// Error
let kErrorDomain = "com.DishWasher.error"

// Enums
enum ErrorManagerErrorCode: Int {

    case NilURLString = 1
    case NilResponseData
}

// Page Title
let PageTitleProductGridVC = "Dishwashers"

// CollectionView Cell Identifier
let kCellID_JLDWProductGridVCCollectionViewCell = "JLDWProductGridVCCollectionViewCell"

// Padding
let leftAndRightPaddings = 10.0

// Segue Identifier
let kSegurID_ToJLDWProductDetailsViewController = "ToJLDWProductDetailsViewController"
