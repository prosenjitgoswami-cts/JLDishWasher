//
//  JLDWProductGridViewController.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductGridViewController: UIViewController {
    @IBOutlet weak var productGridCollectionView: UICollectionView!

    var cellsPerRow:CGFloat = 4
    let cellPadding:CGFloat = 1
    var productDatasource: [Product]?
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

extension JLDWProductGridViewController {

    internal func fetchService() {

        self.presenter.fetchProductList(failed: { (error) in
            print(error)
        }) { (products) in

            self.setNavigationBarTitleWith(productCount: (products?.count)!)
            self.productDatasource = products
            self.productGridCollectionView.reloadData()
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

extension JLDWProductGridViewController: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {



    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return (productDatasource?.count)!
    }


    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellReuseIdentifier: String = JLDWProductGridVCCollectionViewCellID

        let cell: JLDWProductGridVCCollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! JLDWProductGridVCCollectionViewCell
        cell.backgroundColor = UIColor.green;

        if let product = productDatasource?[indexPath.row] {
            cell.setProductDetails(product: product)
        }

        return cell
    }


    /*   func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

     let width = CGFloat(Double(self.view.frame.size.width) - leftAndRightPaddings)/4

     return CGSize(width: 100, height: 100)
     }
     */

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 10, bottom: 0, right:10)
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthMinusPadding = UIScreen.main.bounds.width - (cellPadding * cellsPerRow+1)
        let width = widthMinusPadding / cellsPerRow
        return CGSize(width: 300.0, height: max(width, 300.0))
    }

}


