//
//  Listing.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class ItemVC: UIViewController,UITableViewDataSource, UITableViewDelegate{
   
    @IBOutlet weak var tblViewItem: UITableView!
    
    
    var items: [Item] = {
        var item1 = Item()
        item1.itemImageName = "pizza"
        item1.itemName = "Pizza"
        
        var item2 = Item()
        item2.itemImageName = "pasta"
        item2.itemName = "Pasta"
        
        var item3 = Item()
        item3.itemImageName = "salads"
        item3.itemName = "Salads"
        
        var item4 = Item()
        item4.itemImageName = "dessert"
        item4.itemName = "Dessert"
        
        var item5 = Item()
        item5.itemImageName = "beverage"
        item5.itemName = "Beverage"
        
        return [item1, item2, item3, item4, item5]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        tblViewItem.separatorStyle = .none
        tblViewItem.contentInsetAdjustmentBehavior = .never
    }
    

    //MARK: - UItableview Datasource Delegate Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "tblCellItem") as! tblCellItem
        cell.item = items[indexPath.row]
        return cell
    }
  
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        let item:Item?
        item = items[indexPath.row]
        if let imagName = item?.itemImageName {
            let currentImg = UIImage(named: imagName)
            let imageCrop = currentImg?.getCropRatio()
            let height:CGFloat = tblViewItem.frame.width / imageCrop!
            print("Height : \(height)")
            return height
        }
        
       return 0
        
     
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item:Item?
        item = items[indexPath.row]
        
        let subItemVC = self.storyboard?.instantiateViewController(withIdentifier: "SubItemVC") as! SubItemVC
        subItemVC.strSubItemTitle = item?.itemName
        self.navigationController?.pushViewController(subItemVC, animated: true)
    }

}
