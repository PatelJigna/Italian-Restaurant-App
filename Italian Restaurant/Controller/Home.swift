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
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setInitialView()
       
    }
    
    func setInitialView() {
        
        viewStartOrder.layer.cornerRadius = 16.0
        viewStartOrder.clipsToBounds = true
        
    }
    
    @IBAction func btnGoToListingVC(_ sender: Any) {
        
        let tabBar = self.storyboard?.instantiateViewController(withIdentifier: "tabBar") as! UITabBarController
        
        let appdelegate = UIApplication.shared.delegate as! AppDelegate
        appdelegate.window?.rootViewController = tabBar
    }
    
    
    
}
