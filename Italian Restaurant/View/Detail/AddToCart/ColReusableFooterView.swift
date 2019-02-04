//
//  ColReusableFooterView.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 31.01.19.
//  Copyright © 2019 Jigna Patel. All rights reserved.
//

import UIKit

class ColReusableFooterView: UICollectionReusableView {
    @IBOutlet weak var btnOrderNow: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        btnOrderNow.layer.cornerRadius = 25.0
        btnOrderNow.clipsToBounds = true
        btnOrderNow.layer.borderWidth = 0.0
        btnOrderNow.layer.borderColor = UIColor.clear.cgColor
    }
    
}
