//
//  JLDWProductGridVCCollectionViewCell.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductGridVCCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productCostLabel: UILabel!
    @IBOutlet weak var productBriefDescLabel: UILabel!

    // Public Function
    public func setProductDetails(product: Product) {
        if let productTitle = product.title {
            productBriefDescLabel.text = productTitle

        }
        if let priseDisplayString = product.priseDisplayString {
          productCostLabel.text = priseDisplayString
        }

        if let imageURLString = product.imageURLString {
            
            var imageURLStringWithHTTPS: String = "https:"
            imageURLStringWithHTTPS.append(imageURLString);
            // Download image and set in imagevieew
            productImageView.imageFromServerURL(urlString: imageURLStringWithHTTPS)
        }
    }
}
