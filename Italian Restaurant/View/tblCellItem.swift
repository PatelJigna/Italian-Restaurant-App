//
//  tblCellItemListing.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit
import SDWebImage

class tblCellItem: UITableViewCell {
    
    @IBOutlet weak var imgViewItem: UIImageView!
    
    @IBOutlet weak var lblItemName: UILabel!
    
    @IBOutlet weak var lblNoOfItems: UILabel!
    
    
    @IBOutlet weak var viewGradient: UIView!
    
    var item: Item? {
        didSet {
            
            if let imageName = item?.itemImageName {
                imgViewItem.image = UIImage(named: imageName)
            }
            lblItemName.text = item?.itemName
            lblNoOfItems.text = item?.noOfItems
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // viewGradient.setGradientBackground(colorOne: .clear, colorTwo: .black)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
