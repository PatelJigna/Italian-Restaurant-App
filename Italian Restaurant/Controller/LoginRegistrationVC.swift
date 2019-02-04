//
//  LoginRegistrationVC.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 11.12.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class LoginRegistrationVC: UIViewController {

    @IBOutlet weak var btnLoginRegistration: UIButton!
    
    @IBOutlet weak var lblAccountText: UILabel!
    
    @IBOutlet weak var btnShowLoginRegistration: UIButton!
    
     var boolIsRegister: Bool?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        btnLoginRegistration.layer.cornerRadius = 24.0
        btnLoginRegistration.clipsToBounds = true
        navigationItem.setHidesBackButton(false, animated: true)
        
        btnLoginRegistration.addTarget(self, action: #selector(btnLoginRegAction(sender:)), for: .touchUpInside)
        
      
        self.showLoginRegistrationAction()
        
        setUpNavBar()
        
    }

    
    func setUpNavBar() {
        //self.navigationItem.title = "Login"
        self.navigationItem.largeTitleDisplayMode = .always
        
       // self.navigationController?.setNavigationBarHidden(false, animated: true)
        navigationItem.setHidesBackButton(false, animated: false)
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barTintColor = UIColor.white
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black, NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 20.0)!]
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black,
                                                                             NSAttributedString.Key.font: UIFont(name: "Montserrat-Bold", size: 34.0)!]
       
        let imgBack = #imageLiteral(resourceName: "back").withRenderingMode(.alwaysOriginal)
        navigationController?.navigationBar.backIndicatorImage = imgBack
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = imgBack
        navigationItem.leftItemsSupplementBackButton = true
        let button = UIBarButtonItem(title: " ", style: .plain, target: self, action: nil)
         navigationItem.setLeftBarButton(button, animated: true)
    }

    
    @IBAction func btnSignUpAction(_ sender: Any) {
       
        showLoginRegistrationAction()

    }
    
    func showRegisterVC() {
        self.navigationItem.title = "Sign Up"
        btnLoginRegistration.setTitle("Sign Up", for: .normal)
        lblAccountText.text = "Already have an account?"
        btnShowLoginRegistration.setTitle("Login", for: .normal)
        Constant.kUserDefault.set(false, forKey: Constant.kIsUserRegistered)
        Constant.kUserDefault.synchronize()
    }
    
    func showLoginVC() {
        self.navigationItem.title = "Login"
        btnLoginRegistration.setTitle("Login", for: .normal)
        lblAccountText.text = "Don't have an account?"
        btnShowLoginRegistration.setTitle("Sign Up", for: .normal)
        Constant.kUserDefault.set(true, forKey: Constant.kIsUserRegistered)
        Constant.kUserDefault.synchronize()
    
    }
    
    @objc func showLoginRegistrationAction()  {
    
         boolIsRegister = Constant.kUserDefault.bool(forKey: Constant.kIsUserRegistered)
         boolIsRegister == false ? showLoginVC() : showRegisterVC()
        
    }
    
    @objc func btnLoginRegAction(sender: UIButton) {
        if boolIsRegister == false {
            //Login
            print("Login With Firebase")
        }
        else {
            //Registration
             print("Reg With Firebase")
        }
        
        goToCart()
        
    }
    
    func goToCart() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
