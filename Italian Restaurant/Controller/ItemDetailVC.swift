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
    
    let footerViewReuseIdentifier = "ColReusableFooterView"
    
    override func viewWillAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.25) {
            self.setNeedsStatusBarAppearanceUpdate()
            self.removeNavBarShadow()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        navigationItem.largeTitleDisplayMode = .never
        
        viewHeader.backgroundColor = UIColor.navigationBgColor
        mainScrollView.backgroundColor = UIColor.white
        colViewItemDetail.isPagingEnabled = true
    
        colViewItemDetail.register(UINib(nibName: "ColCellOrder", bundle: nil), forCellWithReuseIdentifier: "ColCellOrder")
        colViewItemDetail.register(UINib(nibName: "ColCellDescription", bundle: nil), forCellWithReuseIdentifier: "ColCellDescription")
        
        colViewItemDetail.register(UINib(nibName: "ColReusableFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerViewReuseIdentifier)
        
      
        if let flowLayout = colViewItemDetail.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionFootersPinToVisibleBounds = true
        }
       
        let gesture = UISwipeGestureRecognizer(target: self, action: #selector(dismiss(fromGesture:)))
        mainScrollView.addGestureRecognizer(gesture)
        viewMenu.delegate = self
    
    }
    
    func removeNavBarShadow() {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc func dismiss(fromGesture gesture: UISwipeGestureRecognizer) {
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
        navigationController?.interactivePopGestureRecognizer?.isEnabled = true
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellOrder", for: indexPath) as! ColCellOrder
         
            return cell
        }
        else  {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellDescription", for: indexPath) as! ColCellDescription
           
             return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: colViewItemDetail.frame.width, height: 701.0)
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: footerViewReuseIdentifier, for: indexPath) as? ColReusableFooterView
        footerView?.btnOrderNow.addTarget(self, action: #selector(btnAddToCartAction(sender:)), for: .touchUpInside)
        return footerView!
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
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
    
    
    @objc func btnAddToCartAction(sender: UIButton){

        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let loginRegistrationVC = storyboard.instantiateViewController(withIdentifier: "LoginRegistrationVC") as! LoginRegistrationVC
        Constant.kUserDefault.set(false, forKey: Constant.kIsUserRegistered)
        Constant.kUserDefault.synchronize()
        let navController = UINavigationController(rootViewController: loginRegistrationVC)
        self.present(navController, animated: true, completion: nil)
    }
    
}

