//
//  JLDWProductGridViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit


//MARK:------------------------------- * ----------------------------------
//MARK: ViewController Life Cycle
class JLDWProductGridViewController: UIViewController {
	@IBOutlet weak var productGridCollectionView: UICollectionView!
	@IBOutlet weak var indicatorView: UIActivityIndicatorView!
	var cellsPerRow:CGFloat = 4
	let cellPadding:CGFloat = 1
	var productDatasource: [Product]?
	let sectionInsets = UIEdgeInsets(top: 0, left: 1, bottom: 0, right:1)
	lazy var presenter: JLDWProductGridViewControllerPresenter = {
		return JLDWProductGridViewControllerPresenter()
	}()

	override func viewDidLoad() {
		super.viewDidLoad()
		self.productGridCollectionView.delegate = self
		self.productGridCollectionView.dataSource = self
		productDatasource = [Product]()
		configureUI()
		fetchService ()

	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		setNavigationBarTitle(withProductCount: 0)
		updateUIOnOrientation ()
	}

	// Device Orientation Method
	override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
		updateUIOnOrientation ()
	}


	// In a storyboard-based application, you will often want to do a little preparation before navigation
	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

		if segue.identifier == kSegurID_ToJLDWProductDetailsViewController {
			let destinationVC: JLDWProductDetailsViewController = segue.destination as! JLDWProductDetailsViewController
			let selectedProduct = sender
			destinationVC.setProduct(withProduct: selectedProduct as! Product)
		}

	}
}

//MARK:------------------------------- * ----------------------------------

extension JLDWProductGridViewController {

	/**
	Invoke Web Service and Get Products details and Refresh UI
	@param failed: Fail Block

	*/


	internal func fetchService() {

		if Reachability.isConnectedToNetwork() == true {
			showLoadingIndicator()
			self.presenter.fetchProductList(failed: { [weak self] (error) in

				self?.showAlertOnError()
				self?.hideLoadingIndicator()

			}) { [weak self] (products) in

				self?.updateUI(withProducts: products)
				self?.hideLoadingIndicator()
			}
		}
		else {
			showAlertOnNoInternetConnection()
			hideLoadingIndicator()
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
		productDatasource = products
		productGridCollectionView.reloadData()
	}

	/**
	Navigate to JLDWProductDetailsViewController though Segue
	@param product: Selected product details
	*/
	internal func navigateToProductDetailsPage(withSelectedProduct product: Product?) {

		if let product: Product = product {
			self.title = " "

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
	Update UI  On Orientation
	*/
	internal func updateUIOnOrientation() {
		productGridCollectionView.reloadData()
	}

	/**
	Navigate to JLDWProductDetailsViewController though Segue
	@param product: Selected product details
	*/
	internal func setNavigationBarTitle(withProductCount productCount: Int) {

		var pageTitle: String = PageTitleProductGridVC;

		if (productCount > 0) {

			pageTitle.append("("+"\(productCount)"+")")
		}
		self.title = pageTitle

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

}

//MARK:------------------------------- * ----------------------------------
//MARK: CollectionView DataSource and Delegate

extension JLDWProductGridViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

	/**
	Set Number of Items in section
	*/
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

		return (productDatasource?.count)!
	}

	/**
	Create CollectionViewCell
	*/
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

		let cellReuseIdentifier: String = kCellID_JLDWProductGridVCCollectionViewCell

		let cell: JLDWProductGridVCCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! JLDWProductGridVCCollectionViewCell)

		if let product = productDatasource?[indexPath.row] {
			cell.setProductDetails(product: product)

		}
		cell.backgroundColor = UIColor.white
		return cell
	}

	/**
	Set Size in CollectionView cell
	*/
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
		return sectionInsets
	}

	/**
	Set Size in collectionView

	*/
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let widthMinusPadding = sectionInsets.left * (cellsPerRow+1)
		let availableWidth = view.frame.size.width - widthMinusPadding
		let width = (availableWidth / cellsPerRow)
		return CGSize(width: width, height: max(width, 300.0))
	}

	/**
	Select Product Item
	*/
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

		let product = productDatasource?[indexPath.row]
		navigateToProductDetailsPage(withSelectedProduct: product)

	}
}



