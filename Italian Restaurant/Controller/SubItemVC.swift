//
//  subListing.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 05.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class SubItemVC: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var colViewSubItem: UICollectionView!
    
    var strSubItemTitle: String?
    
    var subItems:[SubItem] = {
        
        let subItem1 = SubItem()
        subItem1.imageName = "pizza1"
        subItem1.name = "Supreme Special"
        subItem1.reviews = "(378 Reviews)"
        subItem1.sizeLPrice = "$18.34"
        subItem1.sizeMPrice = "$14.60"
        
        let subItem2 = SubItem()
        subItem2.imageName = "pizza2"
        subItem2.name = "Moonlight"
        subItem2.reviews = "(378 Reviews)"
        subItem2.sizeLPrice = "$15.28"
        subItem2.sizeMPrice = "$12.56"
        
        let subItem3 = SubItem()
        subItem3.imageName = "pizza3"
        subItem3.name = "Chicken Supreme"
        subItem3.reviews = "(378 Reviews)"
        subItem3.sizeLPrice = "$17.23"
        subItem3.sizeMPrice = "$10.34"
        
        let subItem4 = SubItem()
        subItem4.imageName = "pizza4"
        subItem4.name = "Veggie Delight"
        subItem4.reviews = "(378 Reviews)"
        subItem4.sizeLPrice = "$10.29"
        subItem4.sizeMPrice = "$7.19"
        
        let subItem5 = SubItem()
        subItem5.imageName = "pizza5"
        subItem5.name = "Chill Party"
        subItem5.reviews = "(378 Reviews)"
        subItem5.sizeLPrice = "$17.23"
        subItem5.sizeMPrice = "$10.34"
        
        let subItem6 = SubItem()
        subItem6.imageName = "pizza6"
        subItem6.name = "Ocean Hawaiian"
        subItem6.reviews = "(378 Reviews)"
        subItem6.sizeLPrice = "$10.29"
        subItem6.sizeMPrice = "$7.19"
        
        return [subItem1, subItem2, subItem3, subItem4, subItem5, subItem6]
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navigationItem.title = strSubItemTitle
        colViewSubItem.contentInset = UIEdgeInsets(top: 10, left: 12, bottom: 10, right: 12)
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        colViewSubItem.addGestureRecognizer(gesture)
        
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
    
    }
    

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "colCellSubListing", for: indexPath) as! colCellSubItem
        cell.subItem = subItems[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let itemDetailVC = self.storyboard?.instantiateViewController(withIdentifier: "ItemDetailVC") as! ItemDetailVC
        self.navigationController?.pushViewController(itemDetailVC, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: (collectionView.frame.width - 10 - 24)/2, height: 255.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    

}
