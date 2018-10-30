//
//  ItemDetailVC.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 12.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

protocol scrollDelegate : class {
    func scrollToIndex(index: Int)
}

class ItemDetailVC: UIViewController,UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout, scrollDelegate {
    
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    @IBOutlet weak var mainView: UIView!
    
    @IBOutlet weak var viewHeader: UIView!
    
    @IBOutlet weak var colViewItemDetail: UICollectionView!
    
    @IBOutlet weak var viewMenu: viewItemDescription!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        
      //  self.navigationController?.setNavigationBarHidden(true, animated: true)

        viewHeader.backgroundColor = UIColor.navigationBgColor
        mainScrollView.backgroundColor = UIColor.white
        colViewItemDetail.isPagingEnabled = true
    
        colViewItemDetail.register(UINib(nibName: "ColCellBook", bundle: nil), forCellWithReuseIdentifier: "ColCellBook")
        
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        mainScrollView.addGestureRecognizer(gesture)
        viewMenu.delegate = self
    
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellBook", for: indexPath) as! ColCellBook

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: colViewItemDetail.frame.width, height: 701.0)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        viewMenu.horizontalViewLeftConstraint.constant = scrollView.contentOffset.x / 3
        print("Horizontal Constant : \(viewMenu.horizontalViewLeftConstraint.constant)")
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        print("Point: \(targetContentOffset.pointee.x)")
        
        let index:Int = Int(targetContentOffset.pointee.x / view.frame.width)
        let indexpath = IndexPath(item: index, section: 0)
        viewMenu.colViewMenuBar.selectItem(at: indexpath, animated: true, scrollPosition: [])
    }
    
    func scrollToIndex(index: Int) {
        let selectedIndexpath = IndexPath(item: index, section: 0)
        colViewItemDetail.scrollToItem(at: selectedIndexpath, at: [], animated: true)
    }
    
    
}
