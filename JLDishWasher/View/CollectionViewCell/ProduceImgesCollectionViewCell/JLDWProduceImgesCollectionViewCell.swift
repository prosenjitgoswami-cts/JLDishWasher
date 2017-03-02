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

 public func setProductImage(withImageURLString imageURLString: String?) {

	if let imageURLString = imageURLString {
		var imageURLStringWithHTTPS: String = "https:"
		imageURLStringWithHTTPS.append(imageURLString);
		// Download image and set in imagevieew
		productImageView.imageFromServerURL(urlString: imageURLStringWithHTTPS)
	}
	}
}
