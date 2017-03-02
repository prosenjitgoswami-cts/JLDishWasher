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

    var productDatasource: [Product]?
    lazy var presenter: JLDWProductGridViewControllerPresenter = {
        return JLDWProductGridViewControllerPresenter()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        productDatasource = [Product]()
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
        }
    }
    
}

