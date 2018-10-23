//
//  colCellSubListing.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit
import SDWebImage

class colCellSubItem: UICollectionViewCell {
    
    @IBOutlet weak var viewBgSublisting: UIView!
    
    @IBOutlet weak var imgViewName: UIImageView!
    
    @IBOutlet weak var lblName: UILabel!
    
    @IBOutlet weak var lblReviews: UILabel!
    
    @IBOutlet weak var lblSizeLPrice: UILabel!
    
    @IBOutlet weak var lblSizeMPrice: UILabel!
    
    var subItem: SubItem? {
        didSet {
            
            if let imageName = subItem?.imageName {
                imgViewName.image = UIImage(named: imageName)
            }
            
            lblName.text = subItem?.name
            lblReviews.text = subItem?.reviews
            lblSizeLPrice.text = subItem?.sizeLPrice
            lblSizeMPrice.text = subItem?.sizeMPrice
            
        }
    }
  
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.contentView.layer.cornerRadius = 8.0
        self.contentView.layer.borderWidth = 1.0
        self.contentView.layer.borderColor = UIColor.clear.cgColor
        self.contentView.layer.masksToBounds = true
        
        self.layer.shadowOffset = .zero
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.masksToBounds = false
        self.layer.shadowRadius = 12.0
        self.layer.shadowPath = UIBezierPath(roundedRect:self.bounds, cornerRadius:self.contentView.layer.cornerRadius).cgPath
    }

}
