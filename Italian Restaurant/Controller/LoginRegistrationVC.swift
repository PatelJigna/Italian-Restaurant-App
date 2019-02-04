//
//  LoginRegistrationVC.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 11.12.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit
import Firebase

class LoginRegistrationVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var btnLoginRegistration: UIButton!
    
    @IBOutlet weak var lblAccountText: UILabel!
    
    @IBOutlet weak var btnShowLoginRegistration: UIButton!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var txtPassword: UITextField!
    
    
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

    
    //MARK: - Button Actions
    
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
    
         txtEmail.text = ""
         txtPassword.text = ""
         boolIsRegister = Constant.kUserDefault.bool(forKey: Constant.kIsUserRegistered)
         boolIsRegister == false ? showLoginVC() : showRegisterVC()
        
    }
    
    @objc func btnLoginRegAction(sender: UIButton) {
        self.view.endEditing(true)
        
        if boolIsRegister == false {
            //Login
            LoginUserWithFirebase()
        }
        else {
            //Registration
            RegisterUserWithFirebase()
        }
    
    }
    
    func LoginUserWithFirebase() {
        guard let email = txtEmail.text, email.count > 0 else {
            UIAlertController.showAlertWithOkButton(self, aStrMessage: Message.kBlankEmail) { (index, str) in
                self.txtEmail.becomeFirstResponder()
            }
            return
            
        }
        guard let pwd = txtPassword.text, pwd.count > 0 else {
            UIAlertController.showAlertWithOkButton(self, aStrMessage: Message.kBlankPwd) { (index, str) in
                self.txtPassword.becomeFirstResponder()
            }
             return
        }
        
        Auth.auth().signIn(withEmail: email, password: pwd) { (user, error) in
            if error != nil {
            //    print("Failed to login with Firebase",error ?? "")
                UIAlertController.showAlertWithOkButton(self, aStrMessage: error?.localizedDescription, completion: nil)
                return
            }
            
            print("Successfully Logged in with Firebase.")
            self.goToCart()
        }
        
    }
    
    func RegisterUserWithFirebase() {
        
        guard let email = txtEmail.text, email.count > 0 else {
            UIAlertController.showAlertWithOkButton(self, aStrMessage: Message.kBlankEmail) { (index, str) in
                self.txtEmail.becomeFirstResponder()
            }
            return
        }
        guard let pwd = txtPassword.text, pwd.count > 0 else {
            UIAlertController.showAlertWithOkButton(self, aStrMessage: Message.kBlankPwd) { (index, str) in
                self.txtPassword.becomeFirstResponder()
            }
            return
        }
        Auth.auth().createUser(withEmail: email, password: pwd) { (user, error) in
            if error != nil {
               // print(error ?? "")
                UIAlertController.showAlertWithOkButton(self, aStrMessage: error?.localizedDescription, completion: nil)
                return
            }
            
            guard let uid = user?.user.uid else {
                return
            }
            
            let valueDict = ["email": email]
            let values = [uid: valueDict]
            let userReference = Database.database().reference().child("users")
            
            userReference.updateChildValues(values, withCompletionBlock: { (err, ref) in
                if err != nil {
                    //print("Failed to Save User into DB",err ?? "")
                    UIAlertController.showAlertWithOkButton(self, aStrMessage: err?.localizedDescription, completion: nil)
                    return
                }
                
                print("Successfully saved user into db")
                 self.goToCart()
            })
            
        }
    }
    
    func goToCart() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: Textfield Delegate Methods
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if textField == txtEmail {
            txtPassword.becomeFirstResponder()
        }
        else if textField == txtPassword {
             boolIsRegister == false ? LoginUserWithFirebase() : RegisterUserWithFirebase()
        }
        
        return true
    }
    
}
