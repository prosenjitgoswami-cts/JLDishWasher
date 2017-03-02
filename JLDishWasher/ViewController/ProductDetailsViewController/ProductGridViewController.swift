//
//  ProductGridViewController.swift
//  DishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class ProductGridViewController: UIViewController {
    @IBOutlet weak var productGridCollectionView: UICollectionView!

    var productDatasource: [Product]?

    lazy var presenter: ProductGridViewControllerPresenter = {
        return ProductGridViewControllerPresenter()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        productDatasource = [Product]()
        configureUI()
        fetchService ()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }




    /*
     // MARK: - Navigation

     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */

}

//MARK: Private Method

extension ProductGridViewController {

    internal func fetchService() {

        
        self.presenter.fetchProductList(failed: { (error) in
            print(error)
        }) { (products) in
            self.setNavigationBarTitleWith(productCount: (products?.count)!)
        }
    }

    internal func configureUI() {

        setNavigationBarTitleWith(productCount: 0)
    }

    private func setNavigationBarTitleWith(productCount: Int) {

        var pageTitle: String = PageTitleProductGridVC;

        if (productCount > 0) {

            pageTitle.append("("+"\(productCount)"+")")
        }
        self.title = pageTitle

    }
}

extension ProductGridViewController: UICollectionViewDataSource {


    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return (productDatasource?.count)!
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellReuseIdentifier: String = "ProductGridVCCell"
        let cell: ProductGridVCCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! ProductGridVCCollectionViewCell
        cell.backgroundColor = UIColor.green;

        if let product = productDatasource?[indexPath.row] {
            cell.setProductDetails(product: product)
        }

        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        let width = CGFloat(Double(self.view.frame.size.width) - leftAndRightPaddings)/4
        
        return CGSize(width: width, height: width)
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 20, left: 8, bottom: 5, right: 8)
    }
    
    
    
}

