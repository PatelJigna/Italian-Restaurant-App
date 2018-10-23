//
//  ItemDetailVC.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 12.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
  
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var viewHeader: UIView!
    
    @IBOutlet weak var colViewItemDetail: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        colViewItemDetail.isPagingEnabled = true
    
        colViewItemDetail.register(UINib(nibName: "ColCellBook", bundle: nil), forCellWithReuseIdentifier: "ColCellBook")
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellBook", for: indexPath) as! ColCellBook
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: colViewItemDetail.frame.width, height: 798.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    
}
