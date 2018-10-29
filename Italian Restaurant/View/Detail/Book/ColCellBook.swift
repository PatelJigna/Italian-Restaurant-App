//
//  ColCellBook.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 15.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class ColCellBook: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout  {
    

    @IBOutlet weak var colViewSize: UICollectionView!
    
    @IBOutlet weak var viewQuantity: UIView!
    
    @IBOutlet weak var btnThick: UIButton!
    
    @IBOutlet weak var btnThin: UIButton!
        
    @IBOutlet weak var txtDescription: UITextView!
    
    @IBOutlet weak var btnOrderNow: UIButton!
    
    var arrSize:[String] = ["""
                            Size L
                            (8 Slices) $17.23
                            """,
                            """
                             Size M
                             (6 Slices) $10.34
                            """]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        setInitialView()
        
        setColViewSize()
        
        setButtonProperty()
    }
    
    func setInitialView() {
        setBorderCornerRadius(view: viewQuantity, cornerRadius: 8.0, borderWidth: 1.0, borderColor: UIColor.commonBorderColor)
        setBorderCornerRadius(view: btnThin, cornerRadius: 8.0, borderWidth: 1.0, borderColor: UIColor.commonBorderColor)
        setBorderCornerRadius(view: btnThick, cornerRadius: 8.0, borderWidth: 1.0, borderColor: UIColor.commonBorderColor)
        setBorderCornerRadius(view: btnOrderNow, cornerRadius: 25.0, borderWidth: 0.0, borderColor: UIColor.clear.cgColor)
        setBorderCornerRadius(view: txtDescription, cornerRadius: 8.0, borderWidth: 1.0, borderColor: UIColor.commonBorderColor)
    }
    
    func setBorderCornerRadius(view:UIView, cornerRadius:CGFloat, borderWidth:CGFloat, borderColor: CGColor){
            view.layer.cornerRadius = cornerRadius
            view.clipsToBounds = true
            view.layer.borderWidth = borderWidth
            view.layer.borderColor = borderColor
        
        }
    
    
    func setColViewSize() {
        colViewSize.dataSource = self
        colViewSize.delegate = self
        
        colViewSize.register(UINib(nibName: "ColCellSize", bundle: nil), forCellWithReuseIdentifier: "ColCellSize")
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        colViewSize.selectItem(at: selectedIndexPath as IndexPath, animated: false, scrollPosition: .init(rawValue: 0))
        colViewSize.isScrollEnabled = false
    }
    
    
    func setButtonProperty() {
        btnThick.isSelected = true
        btnThin.isSelected = false
        
        btnThick.setTitleColor(UIColor.gray, for: .normal)
        btnThick.setTitleColor(UIColor.white, for: .selected)
        btnThick.tintColor = UIColor.clear
        btnThick.backgroundColor = UIColor.selectedTextColor
        
        btnThin.setTitleColor(UIColor.gray, for: .normal)
        btnThin.setTitleColor(UIColor.white, for: .selected)
        btnThin.tintColor = UIColor.clear
        btnThin.backgroundColor = UIColor.white
        
        btnThick.addTarget(self, action: #selector(btnPizzaStyleSelected(sender:)), for: .touchUpInside)
        
        btnThin.addTarget(self, action: #selector(btnPizzaStyleSelected(sender:)), for: .touchUpInside)
    }
    
    @objc func btnPizzaStyleSelected(sender: UIButton) {
        if sender == btnThick {
            btnThick.isSelected = true
            btnThin.isSelected = false
            btnThick.backgroundColor = UIColor.selectedTextColor
            btnThin.backgroundColor = UIColor.white
            
        } else if sender == btnThin {
            btnThick.isSelected = false
            btnThin.isSelected = true
            btnThick.backgroundColor = UIColor.white
            btnThin.backgroundColor = UIColor.selectedTextColor
        }
    }
    
    //MARK: - UICollectionview Datasource Delegate Methods
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellSize", for: indexPath) as! ColCellSize
        cell.lblSize.text = arrSize[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (colViewSize.frame.width - 10)/2, height: 156.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
   
}
