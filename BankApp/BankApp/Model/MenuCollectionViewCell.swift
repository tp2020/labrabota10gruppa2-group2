//
//  CollectionViewCell.swift
//  BankApp
//
//  Created by fpmiadmin on 5/23/20.
//  Copyright © 2020 tp2020. All rights reserved.
//

import UIKit

class MenuCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    var item:Account? {
        didSet {
            numberLabel.text = item?.number
            typeLabel.text = item?.type
            
            if item!.isBlocked {
                imageView.image = UIImage.init(named: "blocked")
            }
            else {
                imageView.image = UIImage.init(named: "active")
            }
        }
    }
    
    
}
