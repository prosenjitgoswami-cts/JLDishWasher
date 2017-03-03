//
//  JLDWProduceImgesCollectionViewCell.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProduceImgesCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var productImageView: UIImageView!


    /**
     Set Product Details and Update UI
     */
    public func setProductImage(withImageURLString imageURLString: String?) {

        updateUI(with: imageURLString)
    }

    /**
     Update UI
     */
    private func updateUI(with imageURLString: String?) {
        if let imageURLString = imageURLString {
            //imageURLString is not contained https: so added
            if  let imageURLStringWithHTTPS = imageURLString.addHTTPSAndColonPrefixIfNotExits(){
                //Set Download image in productImageView
            productImageView.imageFromServerURL(urlString: imageURLStringWithHTTPS)
            }
        }
    }
}
