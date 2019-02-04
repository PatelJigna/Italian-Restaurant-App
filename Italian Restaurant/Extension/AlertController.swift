//
//  AlertController.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 04.02.19.
//  Copyright © 2019 Jigna Patel. All rights reserved.
//

import Foundation
import UIKit

extension UIAlertController {
    
    /**
     Display an Alert / Actionsheet
     
     - parameter controller:     Object of controller on which you need to display Alert/Actionsheet
     - parameter aStrMessage:    Message to display in Alert / Actionsheet
     - parameter style:          .Alert / .Actionshhet
     - parameter aCancelBtn:     Cancel button title
     - parameter aDistrutiveBtn: Distructive button title
     - parameter otherButtonArr: Array of other button title
     - parameter completion:     Completion block. Other Button Index Starting From - 0 | Destructive Index - (Last / 2nd Last Index) | Cancel Index - (Last / 2nd Last Index)
     */
    
    class func showAlert(_ controller : AnyObject ,
                         aStrMessage :String? ,
                         style : UIAlertController.Style ,
                         aCancelBtn :String? ,
                         aDistrutiveBtn : String?,
                         otherButtonArr : Array<String>?,
                         completion : ((Int, String) -> Void)?) -> Void {
        
        let strTitle = Constant.kAppTitle
    
        let alert = UIAlertController.init(title: strTitle, message:aStrMessage , preferredStyle: style)
        
        
        if let strDistrutiveBtn = aDistrutiveBtn {
            
            let aStrDistrutiveBtn = strDistrutiveBtn
            
            alert.addAction(UIAlertAction.init(title: aStrDistrutiveBtn, style: .destructive, handler: { (UIAlertAction) in
                
                completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strDistrutiveBtn)
            }))
        }
        
        if let strCancelBtn = aCancelBtn {
            
            let aStrCancelBtn = strCancelBtn
            
            alert.addAction(UIAlertAction.init(title: aStrCancelBtn, style: .cancel, handler: { (UIAlertAction) in
                
                if ( aDistrutiveBtn != nil ) {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count + 1 : 1, strCancelBtn)
                } else {
                    completion?(otherButtonArr != nil ? otherButtonArr!.count : 0, strCancelBtn)
                }
                
            }))
        }
        
        if let arr = otherButtonArr {
            
            for (index, value) in arr.enumerated() {
                
                let aValue = value
                
                alert.addAction(UIAlertAction.init(title: aValue, style: .default, handler: { (UIAlertAction) in
                    
                    completion?(index, value)
                    
                }))
            }
        }
        
        controller.present(alert, animated: true, completion: nil)
        
    }
    

    /**
     Display an Alert With "Ok" Button
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Alert
     - parameter completion:  Completion block. Ok Index - 0
     */
    class func showAlertWithOkButton(_ controller : AnyObject ,
                                     aStrMessage :String? ,
                                     completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, aStrMessage: aStrMessage, style: .alert, aCancelBtn: nil, aDistrutiveBtn: nil, otherButtonArr: ["Ok"], completion: completion)
        
    }
    
    
    
    /**
     Display an Alert With "Cancel" Button
     
     - parameter controller:  Object of controller on which you need to display Alert
     - parameter aStrMessage: Message to display in Alert
     - parameter completion:  Completion block. Cancel Index - 0
     */
    class func showAlertWithCancelButton(_ controller : AnyObject ,
                                         aStrMessage :String? ,
                                         completion : ((Int, String) -> Void)?) -> Void {
        
        self.showAlert(controller, aStrMessage: aStrMessage, style: .alert, aCancelBtn: "Cancel", aDistrutiveBtn: nil, otherButtonArr: nil, completion: completion)
        
    }
    
}
