//
//  AttributeTableViewCell.swift
//  JLDishWasher
//
//  Created by Prsenjit Goswami on 03/03/17.
//  Copyright © 2017 CTS. All rights reserved.
//

import UIKit

class AttributeTableViewCell: UITableViewCell {
    @IBOutlet weak var attributeNameLabel: UILabel!
    @IBOutlet weak var attributeValueLabel: UILabel!


    // Public Method

    /**
     Set Attribute and update UI
     */
    public func setAttribute(with attribute: Attribute?) {

        if let attribute = attribute {
            updateUI(with: attribute)
        }
    }

    /**
     Update UI
     */
    private func updateUI(with attribute: Attribute?) {

        // Set text in attributeNameLabel
        if let attributeName = attribute?.attributeName {
            attributeNameLabel.text = attributeName
        }

        // Set text in attributeValueLabel
        if let attributeValue = attribute?.attributeValue {
            attributeValueLabel.text = attributeValue
        }
    }
}

