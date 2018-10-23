//
//  Extensions.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

extension UIImage {
    func getCropRatio() -> CGFloat {
        let widthRatio = CGFloat(self.size.width/self.size.height)
        return widthRatio
    }
}


