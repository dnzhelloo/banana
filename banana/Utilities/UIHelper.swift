//
//  UIHelper.swift
//  banana
//
//  Created by Deniz on 5.06.2023.
//

import UIKit

struct UIHelper{
    
    func createOneColumnFlowLayout(in view:UIView) -> UICollectionViewFlowLayout {
        let width                       = view.bounds.width
        let padding: CGFloat            = 12
        let availableWidth              = width - (padding * 2)
        let itemWidth                   = availableWidth
        
        let flowLayout                  = UICollectionViewFlowLayout()
        flowLayout.sectionInset         = UIEdgeInsets(top: padding, left: padding, bottom: padding, right: padding)
        flowLayout.itemSize             = CGSize(width: itemWidth, height: 120)
        
        return flowLayout
        
    }
    
}
