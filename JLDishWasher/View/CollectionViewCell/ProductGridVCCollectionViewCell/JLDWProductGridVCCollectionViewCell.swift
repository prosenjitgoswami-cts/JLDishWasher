//
//  JLDWProductGridVCCollectionViewCell.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductGridVCCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: CustomImageView!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productBriefDescLabel: UILabel!

    /**
     Set Product Details and Update ui
     */
    public func setProductDetails(product: Product) {
        updateUI(product: product)
    }

    /**
     Update UI
     */
    private  func updateUI(product: Product) {

        // Set text Title
        if let productTitle = product.title {
            productBriefDescLabel.text = productTitle
        }

        // Set text product Cost
        if let priseDisplayString = product.priseDisplayString {
            productCostLabel.text = priseDisplayString
        }

        // Set image product Image View
        if let imageURLString = product.imageURLString {

            // Download image and set in image view

            if  let imageURLStringWithHTTPS = imageURLString.addHTTPSPrefix(){

                productImageView.loadImage(withURLString: imageURLStringWithHTTPS)
            }
        }
    }
}
