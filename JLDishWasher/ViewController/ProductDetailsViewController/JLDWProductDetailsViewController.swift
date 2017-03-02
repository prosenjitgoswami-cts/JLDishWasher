//
//  JLDWProductDetailsViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewController: UIViewController {

    lazy var presenter: JLDWProductDetailsViewControllerPresenter = {
        return JLDWProductDetailsViewControllerPresenter()
    }()

    var productID: String?
    var datasource: [SpecificProductInfo]?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        fetchService()

    }

    public func setProduct(withProduct product: Product) {
        productID = product.productId;
    }

}


//MARK:------------------------------- * ----------------------------------

extension JLDWProductDetailsViewController {

    /**
     Invoke Web Service and Get Products details and Refresh UI
     @param failed: Fail Block

     */
    func fetchService() {

        if let productID  = productID {
            presenter.fetchProductDetails(withProducetID: productID, failed: { (error) in

            }, success: {(specificProductInfos) in

                print ("Helllllll")
                self.datasource = specificProductInfos;
            })
        }
    }

    /**
     Update UI
     @param products: Collection of Product
     */
    internal func updateUI(withProducts products: [Product]?) {

        if let products = products {
            setNavigationBarTitle(withProductCount:products.count)

        }
    }

    /**
     Navigate to JLDWProductDetailsViewController though Segue
     @param product: Selected product details
     */
    internal func navigate(withSelectedProduct product: Product?) {

        if let product: Product = product {
            self.performSegue(withIdentifier: kSegurID_ToJLDWProductDetailsViewController, sender: product)
        }
    }

    /**
     Set Navigation Bar Title
     */
    internal func configureUI() {

        setNavigationBarTitle(withProductCount: 0)
    }


    /**
     Navigate to JLDWProductDetailsViewController though Segue
     @param product: Selected product details
     */
    private func setNavigationBarTitle(withProductCount productCount: Int) {

        var pageTitle: String = PageTitleProductGridVC;
        
        if (productCount > 0) {
            
            pageTitle.append("("+"\(productCount)"+")")
        }
        self.title = pageTitle
        
    }
}





