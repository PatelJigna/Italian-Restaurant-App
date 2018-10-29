//
//  viewStar.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 29.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class viewStar: UIView {
    
    @IBOutlet var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()

        //fatalError("init(coder:) has not been implemented")
    }
    
    
    func commonInit()  {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "viewStar", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
    }
    
}
