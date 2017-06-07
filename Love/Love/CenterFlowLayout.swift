//
//  CenterFlowLayout.swift
//  Love
//
//  Created by Emiaostein on 31/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit

class CenterFlowLayout: UICollectionViewFlowLayout {
    
    
    override func prepare() {
        super.prepare()
        collectionView?.decelerationRate = UIScrollViewDecelerationRateFast
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint, withScrollingVelocity velocity: CGPoint) -> CGPoint {
        let targetoffset: CGPoint
        guard let c = collectionView else { return CGPoint.zero }
        let w = c.bounds.width
        let h = c.bounds.height
        let cw = proposedContentOffset.x + w / 2
        
        guard let items = layoutAttributesForElements(in: CGRect(origin: proposedContentOffset, size: CGSize(width: w, height: h))), items.count > 0 else {return CGPoint.zero}
        
        let item = items.reduce(items[0]) {fabs($0.0.frame.midX - cw) < fabs($0.1.frame.midX - cw) ? $0.0 : $0.1}
        let distance = cw - item.frame.midX
        
        let dir = velocity.x / fabs(velocity.x)
        let extense = fabs(velocity.x) == 0.0 || fabs(velocity.x) > 1.0 ? 0 : ((item.frame.width + minimumLineSpacing) * dir)
        targetoffset = CGPoint(x: proposedContentOffset.x - distance + extense, y: proposedContentOffset.y)
        
        return targetoffset
        
    }
    
    override func targetContentOffset(forProposedContentOffset proposedContentOffset: CGPoint) -> CGPoint {
        let targetoffset: CGPoint
        
        guard let c = collectionView else { return CGPoint.zero }
        let w = c.bounds.width
        let h = c.bounds.height
        let cw = proposedContentOffset.x + w / 2
        
        guard let items = layoutAttributesForElements(in: CGRect(origin: proposedContentOffset, size: CGSize(width: w, height: h))), items.count > 0 else {return CGPoint.zero}
        
        let item = items.reduce(items[0]) {fabs($0.0.frame.midX - cw) < fabs($0.1.frame.midX - cw) ? $0.0 : $0.1}
        let distance = cw - item.frame.minX
        
        targetoffset = CGPoint(x: proposedContentOffset.x - distance, y: proposedContentOffset.y)
        
        return targetoffset
    }

}
