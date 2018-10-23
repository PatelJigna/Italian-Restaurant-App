//
//  Home.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit
import SDWebImage

class Home: UIViewController {
    
    @IBOutlet weak var viewStartOrder: UIView!
    
    @IBOutlet weak var imgViewBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialView()
       
    }
    
    func setInitialView() {
        
        viewStartOrder.layer.cornerRadius = 16.0
        viewStartOrder.clipsToBounds = true
        
    }
    
   
    @IBAction func btnGoToListingVC(_ sender: Any) {
        
        let itemVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemVC") as! ItemVC
        self.navigationController?.pushViewController(itemVC, animated: true)
        
    }
    
    
    
}
