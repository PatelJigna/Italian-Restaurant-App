//
//  ColCellMenu.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 15.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class ColCellMenu: UICollectionViewCell {

    @IBOutlet weak var lblMenuTitle: UILabel!
    @IBOutlet weak var viewHorizontal: UIView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         lblMenuTitle.textColor = UIColor.gray
      
    }
    
    override var isSelected: Bool {
        didSet{
           // lblMenuTitle.textColor = isSelected ? UIColor(red: 30, green: 34, blue: 47, alpha: 1) : UIColor(red: 204, green: 204, blue: 204, alpha: 1)
             lblMenuTitle.textColor = isSelected ? UIColor.black : UIColor.gray
            
        }
    }

}
