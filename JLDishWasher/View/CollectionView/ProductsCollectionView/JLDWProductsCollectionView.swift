//
//  MLDWProductsCollectionView.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 02/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class JLDWProductsCollectionView: UICollectionView {

    var imageDataSources: [String]?
    var cellsPerRow:CGFloat = 1
    let cellPadding:CGFloat = 1
    let sectionInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right:10)


    public func reloadCollectionView(withCollections: [String]?) {

        imageDataSources = withCollections;

        self.delegate = self;
        self.dataSource = self;
        self.reloadData()

    }

}

//MARK:------------------------------- * ----------------------------------
//MARK: CollectionView DataSource and Delegate

extension JLDWProductsCollectionView: UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    /**
     Set Number of Items in section
     */
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return (imageDataSources?.count)!
    }

    /**
     Set Size in collectionView
     */
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthMinusPadding = sectionInsets.left * (cellsPerRow+1)
        let availableWidth = self.frame.size.width - widthMinusPadding
        let width = (availableWidth / cellsPerRow)
        return CGSize(width: width, height: max(width, 300.0))
    }


    /**
     Create CollectionViewCell
     */
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cellReuseIdentifier: String = kCellID_JLDWProduceImgesCollectionViewCell

        let cell: JLDWProduceImgesCollectionViewCell = (collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! JLDWProduceImgesCollectionViewCell)

        if let setProductImageURLString = imageDataSources?[indexPath.row] {
            cell.setProductImage(withImageURLString: setProductImageURLString)
            
        }
        cell.backgroundColor = UIColor.lightGray
        return cell
    }
    
    
}
