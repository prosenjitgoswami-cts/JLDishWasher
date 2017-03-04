//
//  JLDWProductDetailsViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 01/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductDetailsViewController: UIViewController {
	@IBOutlet weak var indicatorView: UIActivityIndicatorView!
	@IBOutlet weak var trailingConstraintsForLanSepetView: NSLayoutConstraint!
	@IBOutlet weak var customImageCarouselView: CustomImageCarouselView!
	@IBOutlet weak var landscapeSeparetorView: UIView!
	// This Stzckvire chanes its axis on orientation.
	@IBOutlet weak var axisChangableContainerView: UIView!
	@IBOutlet weak var productInfoLabel: UILabel!
	@IBOutlet weak var productSpecificationLabel: UILabel!
	@IBOutlet weak var productsepcLabel: UILabel!
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
	@IBOutlet weak var orientationChangeStackViewHConstraints: NSLayoutConstraint!
	@IBOutlet weak var productDetailsWidthConstraints: NSLayoutConstraint!
	@IBOutlet weak var readMoreBtnContanerHeightConstraint: NSLayoutConstraint!
	var specificProduct: SpecificProductInfo?
	lazy var presenter: JLDWProductDetailsViewControllerPresenter = {
		return JLDWProductDetailsViewControllerPresenter()
	}()

	var productID: String?


	override func viewWillAppear(_ animated: Bool) {

		super.viewWillAppear(animated)
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
	internal func fetchService() {

		if Reachability.isConnectedToNetwork() == true {

			if let productID  = productID {
				showLoadingIndicator()
				presenter.fetchProductDetails(withProducetID: productID, failed: {[weak self] (error) in

					self?.hideLoadingIndicator()

					self?.showAlertOnError(withOKHandler: { (action) in
					}, tryAgainHandler: { [weak self] (action) in
						self?.fetchService()})

					}, success: {[weak self] (specificProductInfos) in

						if let datasource = specificProductInfos {
							self?.specificProduct = datasource[0]
							self?.updateUI()
							self?.hideLoadingIndicator()
						}
				})
			}
		} else {

			hideLoadingIndicator()
			showAlertOnNoInternetConnection(tryAgainHandler: {[weak self] (action) in
				// Fetch setvice on user request
				self?.fetchService()
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

		// Reload Attribute Table View
		reloadAttributeTableView()

		// Set Static String
		productInfoLabel.text = StaticStrProductInformation
		productSpecificationLabel.text = StaticProductSpecification
		//Set axisChangableStackView backgroundColor
		axisChangableStackView.backgroundColor = UIColor.lightGray
		axisChangableContainerView.backgroundColor = UIColor.lightGray

		// Change the visibility of attributesTableView
		attributesTableView.isHidden = false


		setTextProductDescLabelAndProductCodeLabelOnOrientationBased()
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
	internal func updateUIOnOrientation() {

		let isPortrait = UIDevice.current.orientation.isPortrait

		if isPortrait {
			updateUIOnPortraitOrientation()
		} else {
			updateUIOnLandscapeOrientation()
		}


		/*
		** //1, 3 index view is usedFor Specing, because In code there are uneven specing. So not used StackView specing
		In portrait mode Verticle Stack view as follow
		
		0-[productInfoLabel]
		1-[UIVIew]
		2-[productDescLabel]
		3-[UIView]
		4-[productCodeLabel]
		

		In Landscape mode Verticle Stack view as follow

		0-[productInfoLabel]
		1-[UIVIew]
		2-[productCodeLabel]
		3-[UIView]
		4-[productDescLabel]

		*/
		setTextProductDescLabelAndProductCodeLabelOnOrientationBased()
		uiComponentVisibilityChange(isHidden: isPortrait)
		self.view.layoutIfNeeded()
		self.view.needsUpdateConstraints()
	}

	/* Show loading
	*/
	private func showLoadingIndicator() {
		self.indicatorView.bringSubview(toFront: self.view)
		self.indicatorView.isHidden = false
		self.indicatorView.startAnimating()
	}

	/*
	Hide Loading Indicator
	*/
	private func hideLoadingIndicator() {
		self.indicatorView.isHidden = true
		self.indicatorView.stopAnimating()
	}

	/*
	update UI on portrait orientation
	*/
	private func updateUIOnPortraitOrientation() {
		axisChangableStackView.axis = .vertical
		readMoreBtnContanerHeightConstraint.constant = 0
		productDetailsWidthConstraints.constant = UIScreen.main.bounds.width
		orientationChangeStackViewHConstraints.constant = UIScreen.main.bounds.height/2
		axisChangableStackView.spacing = 10.0
		landscapeSeparetorView.backgroundColor = UIColor.clear
		trailingConstraintsForLanSepetView.constant = 0

	}

	/*
	update UI on Landscape orientation
	*/
	private func updateUIOnLandscapeOrientation() {

		landscapeSeparetorView.backgroundColor = UIColor.lightGray
		axisChangableStackView.axis = .horizontal
		readMoreBtnContanerHeightConstraint.constant = 40
		productDetailsWidthConstraints.constant = 300
		trailingConstraintsForLanSepetView.constant = productDetailsWidthConstraints.constant + landscapeSeparetorView.frame.size.width
		axisChangableStackView.spacing = 0.0
		orientationChangeStackViewHConstraints.constant = (UIScreen.main.bounds.height/2) - 150.0
	}

	private func setTextProductDescLabelAndProductCodeLabelOnOrientationBased() {

		//TODO: use stack View exchangeView at index
		//Set productCodeLabel text

		var productCodeStr:String?
		var productInformationStr:String?

		if let productCode = specificProduct?.code {
			productCodeStr = StaticProductCodeWithColon
			productCodeStr = productCodeStr! + productCode;
		}

		//Set productDescLabel text
		if let productInformation = specificProduct?.productInformation {
			productInformationStr = productInformation.removeHTMLTagsInString()
		}

		if UIDevice.current.orientation.isPortrait {
			productDescLabel.text = productInformationStr
			productCodeLabel.text = productCodeStr
		} else {
			productDescLabel.text = productCodeStr
			productCodeLabel.text = productInformationStr
		}

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
	private func reloadImageCarouselView() {
		if let _productImagesDataSource = specificProduct?.media?.imageURLStrings {
			customImageCarouselView.imageURLStrings = _productImagesDataSource;
		}
	}

	/**Reload Attribute Table view
	*/
	private func reloadAttributeTableView () {

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





