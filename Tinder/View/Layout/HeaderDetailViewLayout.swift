//
//  HeaderDetailViewLayout.swift
//  Tinder
//
//  Created by Rodrigo Vart on 16/04/22.
//

import Foundation
import UIKit

class HeaderDetailViewLayout: UICollectionViewFlowLayout {
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let layoutAttr = super.layoutAttributesForElements(in: rect)
        
        layoutAttr?.forEach({ attr in
            if attr.representedElementKind == UICollectionView.elementKindSectionHeader {
                guard let collectionView = collectionView else { return }
                
                let contentOffSetY = collectionView.contentOffset.y
                
                attr.frame = CGRect(x: 0, y: contentOffSetY, width: collectionView.bounds.width, height: attr.bounds.height - contentOffSetY)
            }
        })

        return layoutAttr
    }
    
    override func shouldInvalidateLayout(forBoundsChange newBounds: CGRect) -> Bool {
        return true
    }

}
