//
//  JLDWProductDetailsViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewController: UIViewController {

	@IBOutlet weak var productImagesCollectionView: JLDWProductsCollectionView!
	//@IBOutlet weak var priceDetailsHConstraint: NSLayoutConstraint!
	//@IBOutlet weak var rightSidePanelWidthConstraints: NSLayoutConstraint!
	//@IBOutlet weak var rightPanelContainerView: UIView!
	//@IBOutlet weak var leftPanelContainerView: UIView!

	// This Stzckvire chanes its axis on orientation.
	@IBOutlet weak var axisChangableStackView: UIStackView!
	@IBOutlet weak var productFeaturesStackView: UIStackView!

	@IBOutlet weak var priceLabel: UILabel!
	@IBOutlet weak var displaySpecialOfferLabel: UILabel!
	@IBOutlet weak var GuaranteeInfoLabel: UILabel!


	var productImagesDataSource: [String]?
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

	// Update UI  On Orientation
	func updateUIOnOrientation() {

		if UIDevice.current.orientation.isLandscape {
			//rightSidePanelWidthConstraints.constant = 300
			//priceDetailsHConstraint.constant = 0
			axisChangableStackView.axis = .horizontal


		} else {
			//rightSidePanelWidthConstraints.constant = 0
			axisChangableStackView.axis = .vertical
		}
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
		setNavigationBarTitle(withProductTitle: specificProduct?.title)
		loadProductImages()

		if let priceLabelText = specificProduct?.priseDisplayString {
			priceLabel.text = priceLabelText
		}

		if let displaySpecialOfferLabelText = specificProduct?.displaySpecialOffer {
			displaySpecialOfferLabel.text = displaySpecialOfferLabelText
		}

		if let guaranteeInfoLabelText = specificProduct?.guaranteeInformation {
			displaySpecialOfferLabel.text = guaranteeInfoLabelText
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


	func loadProductImages() {

		if let _productImagesDataSource = specificProduct?.media?.imageURLStrings {

			productImagesDataSource = _productImagesDataSource
			productImagesCollectionView.reloadCollectionView(withCollections: productImagesDataSource)
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

		// Remove back button title
		self.navigationController?.navigationBar.topItem?.title = ""

	}
}





