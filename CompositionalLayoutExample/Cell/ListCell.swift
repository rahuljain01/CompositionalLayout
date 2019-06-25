//
//  ListCell.swift
//  CompositionalLayoutExample
//
//  Created by Vinita Miranda on 18/06/19.
//  Copyright © 2019 Rahul Jain. All rights reserved.
//

import Foundation
import UIKit
class ListCell: UICollectionViewCell {
    @IBOutlet var titleLabelNumber: UILabel!
    
    @IBOutlet var cellHeight: NSLayoutConstraint!
    
    var isCellHeightNeeded = false
    var cellHeightConstant:CGFloat = 0.0{
        didSet{
            if cellHeight != nil{
                cellHeight.isActive = isCellHeightNeeded
                cellHeight.constant = cellHeightConstant
            }
        }
    }
    
    override func awakeFromNib() {
        cellHeight.isActive = isCellHeightNeeded
        if isCellHeightNeeded {
            cellHeight.constant = cellHeightConstant
        }
        
        layer.borderWidth = 1
        layer.borderColor = UIColor.black.cgColor
        backgroundColor = UIColor(red: 129/255.0, green: 217/255.0, blue: 185.0/255.0, alpha: 1)
    }

}
