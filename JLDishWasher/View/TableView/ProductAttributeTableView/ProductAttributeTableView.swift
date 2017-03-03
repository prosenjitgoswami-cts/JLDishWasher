//
//  ProductAttributeTableView.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 03/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class ProductAttributeTableView: UITableView,UITableViewDelegate,UITableViewDataSource {


    var attributeDataSource: [Attribute]?
    public func reloadCollectionView(with attributes: [Attribute]?) {

        attributeDataSource = attributes;
        self.delegate = self;
        self.dataSource = self;
        self.reloadData()
        
    }
    // MARK: - UITableViewDataSource
     func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (attributeDataSource?.count)!

    }

     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: AttributeTableViewCell = (tableView.dequeueReusableCell(withIdentifier: kCellIDAttributeTableViewCell, for: indexPath) as? AttributeTableViewCell)!

        if let attribute = attributeDataSource?[indexPath.row] {
            cell.setAttribute(with: attribute)
        }
		cell.layoutMargins = .zero;

        return cell
    }

}
