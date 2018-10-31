//
//  tblCellItemDescription.swift
//  Italian Restaurant
//
//  Created by Jigna Patel on 12.10.18.
//  Copyright © 2018 Jigna Patel. All rights reserved.
//

import UIKit

class viewItemDescription: UIView, UICollectionViewDataSource,UICollectionViewDelegate, UICollectionViewDelegateFlowLayout
{
    @IBOutlet var contentView: UIView!
    
    @IBOutlet weak var colViewMenuBar: UICollectionView!
    
    @IBOutlet weak var viewHorizontal: UIView!
    
    @IBOutlet weak var horizontalViewLeftConstraint: NSLayoutConstraint!
    
    var arrMenu = ["Order","Description","Reviews"]
    
    weak var delegate: scrollDelegate?

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
        //fatalError("init(coder:) has not been implemented")
    }
    
    
    func commonInit() {
        let bundle = Bundle(for: type(of: self))
        let nib = UINib(nibName: "viewItemDescription", bundle: bundle)
        contentView = nib.instantiate(withOwner: self, options: nil)[0] as? UIView
        contentView.frame = bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(contentView)
        
        viewHorizontal.translatesAutoresizingMaskIntoConstraints = false
       // contentView.roundCorners(corners: [.topLeft, .topRight], radius: 16)
        setCollectionView()
    }
    
    func setCollectionView() {
       colViewMenuBar.register(UINib(nibName: "ColCellMenu", bundle: nil), forCellWithReuseIdentifier: "ColCellMenu")
        let selectedIndexpath = NSIndexPath(item: 0, section: 0)
        colViewMenuBar.selectItem(at: selectedIndexpath as IndexPath, animated: false, scrollPosition: .init(rawValue: 0))
    }
    
    
    //MARK: - UICollectionview Datasource Delegate Methods

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrMenu.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ColCellMenu", for: indexPath) as! ColCellMenu
        cell.lblMenuTitle.text = arrMenu[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: frame.width/3, height: 34.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
 
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.scrollToIndex(index: indexPath.row)
    }
    
}

