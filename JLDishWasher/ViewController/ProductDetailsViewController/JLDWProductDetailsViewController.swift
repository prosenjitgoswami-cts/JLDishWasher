//
//  JLDWProductDetailsViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewController: UIViewController {


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}


//MARK:------------------------------- * ----------------------------------
//MARK: Public Method

extension JLDWProductDetailsViewController {

public func setProduct(withProduct product: Product) {

	if let endPointURL = URLStringProductPage(withPeroductID: product.productId) {
	print(endPointURL)

	}
	}

}






