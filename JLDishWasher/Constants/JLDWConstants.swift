//
//  JLDWConstants.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//


// Service URL
let kURLStringProductList = "https://api.johnlewis.com/v1/products/search?q=dishwasher&key=Wu1Xqn3vNrd1p7hqkvB6hEu0G9OrsYGb&pageSize=20"


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
let kdisplaySpecialOffer = "displaySpecialOffer"
let kDictAdditionalServices = "additionalServices"
let kDictIncludedServices = "includedServices"
let kDictFeature = "features"
let kDictAttributes = "attributes"
let kDictName = "name"
let kDictValue = "value"

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
let kCellID_JLDWProduceImgesCollectionViewCell = "JLDWProduceImgesCollectionViewCell"

// TableView Cell Identifier
let kCellIDAttributeTableViewCell = "AttributeTableViewCell"

// Padding
let leftAndRightPaddings = 10.0

// Segue Identifier
let kSegurID_ToJLDWProductDetailsViewController = "ToJLDWProductDetailsViewController"

//Static String 

let StaticStrProductInformation =  "Product Information"
let StaticProductSpecification =  "Product specification"

