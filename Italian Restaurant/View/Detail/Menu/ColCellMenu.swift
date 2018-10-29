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
    
        
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
         lblMenuTitle.textColor = UIColor.gray
      
    }
    
    override var isSelected: Bool {
        didSet{

             lblMenuTitle.textColor = isSelected ? UIColor.selectedTextColor : UIColor.deselectedTextcolor
            
        }
    }


}
