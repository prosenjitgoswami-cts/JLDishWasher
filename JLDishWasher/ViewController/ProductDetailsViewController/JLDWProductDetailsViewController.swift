//
//  JLDWProductDetailsViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewController: UIViewController {

    @IBOutlet weak var customImageCarouselView: CustomImageCarouselView!
    // This Stzckvire chanes its axis on orientation.
    @IBOutlet weak var axisChangableStackView: UIStackView!
    @IBOutlet weak var productFeaturesStackView: UIStackView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var displaySpecialOfferLabel: UILabel!
    @IBOutlet weak var guaranteeInfoLabel: UILabel!
    @IBOutlet weak var productCodeLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var seperatorLineBelowPdCodeView: UIView!
    @IBOutlet weak var lowerReadmoreSeperatorLineView: UIView!
    @IBOutlet weak var readMoreBtnContanerView: UIView!
    @IBOutlet weak var attributesTableView: ProductAttributeTableView!
    @IBOutlet weak var rightBackArrowButton: UIImageView!
    @IBOutlet weak var reaMoreButton: UIButton!

    // @IBOutlet LayoutConstraint
    @IBOutlet weak var readMoreBtnContanerHeightConstraint: NSLayoutConstraint!
    var specificProduct: SpecificProductInfo?
    lazy var presenter: JLDWProductDetailsViewControllerPresenter = {
        return JLDWProductDetailsViewControllerPresenter()
    }()

    var productID: String?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func viewWillAppear(_ animated: Bool) {
        fetchService()
        updateUIOnOrientation()
    }

    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        updateUIOnOrientation()
    }

      // PubLic Method
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

            }, success: {[weak self] (specificProductInfos) in

                if let datasource = specificProductInfos {
                    self?.specificProduct = datasource[0]
                    self?.updateUI()
                }
            })
        }
    }

    /**
     Update UI
     @param products: Collection of Product
     */
    internal func updateUI() {

        //Set Navigation Title
        setNavigationBarTitle(withProductTitle: specificProduct?.title)

        //Reload Carosal Product Images
        reloadImageCarouselView()

        //Set priceLabelText text
        if let priceLabelText = specificProduct?.priseDisplayString {
            priceLabel.text = priceLabelText
        }

        //Set displaySpecialOfferLabel text
        if let displaySpecialOfferLabelText = specificProduct?.displaySpecialOffer {
            displaySpecialOfferLabel.text = displaySpecialOfferLabelText
        }

        //Set guaranteeInfoLabel text
        if let guaranteeInfoLabelText = specificProduct?.guaranteeInformation {
            guaranteeInfoLabel.text = guaranteeInfoLabelText
        }

        //Set productCodeLabel text
        if let productCode = specificProduct?.code {
            var productCodeStr = "Product Code:"
            productCodeStr = productCodeStr + productCode;

            productCodeLabel.text = productCodeStr
        }

        //Set productDescLabel text
        if let productInformation = specificProduct?.productInformation {
            productDescLabel.text = productInformation
        }

        // Reload Attribute Table View 
        reloadAttributeTableView()
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

    // Update UI On Orientation
    func updateUIOnOrientation() {

        let isPortrait = UIDevice.current.orientation.isPortrait

        if isPortrait {
            axisChangableStackView.axis = .vertical
            readMoreBtnContanerHeightConstraint.constant = 0
                   } else {
            axisChangableStackView.axis = .horizontal
            readMoreBtnContanerHeightConstraint.constant = 40
        }
        uiComponentVisibilityChange(isHidden: isPortrait)
        self.view.layoutIfNeeded()
        self.view.needsUpdateConstraints()
    }

    // UI component visibility change
    private func uiComponentVisibilityChange(isHidden : Bool) {

        readMoreBtnContanerView.isHidden = isHidden
        lowerReadmoreSeperatorLineView.isHidden = isHidden
        rightBackArrowButton.isHidden = isHidden
        reaMoreButton.isHidden = isHidden
    }
    /**
     Reload Carosal Image View
     */
    func reloadImageCarouselView() {

        customImageCarouselView.currentPageColor = UIColor.black
        if let _productImagesDataSource = specificProduct?.media?.imageURLStrings {
            customImageCarouselView.imageURLStrings = _productImagesDataSource;
        }
    }
    
    /**Reload Attribute Table view
     */
    func reloadAttributeTableView () {
        
        if let attributes = specificProduct?.details?.attributes {

            let sortedAttributes = attributes.sorted {
                $0.attributeName! < $1.attributeName!
            }
              attributesTableView.reloadCollectionView(with: sortedAttributes)
        }
    }
    
    /**
     Navigate to JLDWProductDetailsViewController though Segue
     @param product: Selected product details
     */
    private func setNavigationBarTitle(withProductTitle title: String?) {
        
        if let title = title {
            self.title = title
        }
    }
}





