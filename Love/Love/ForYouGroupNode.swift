////
////  ForYouGroupNode.swift
////  Love
////
////  Created by Emiaostein on 30/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import Foundation
//import AsyncDisplayKit
//
//final class ForYouGroupNode: MediaNode {
//    
//    static let contentInset = UIEdgeInsets(top: 32, left: 32, bottom: 32, right: 32)
//    static let backInset = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)
//    static let spacing: CGFloat = 4
//    
//    let imgs: [ASNetworkImageNode] = {return (0..<9).map({ _ in
//        let n = ASNetworkImageNode()
//        n.cornerRadius = 4
//        n.backgroundColor = UIColor.style.background
//        return n
//    })}()
//    let back = ASDisplayNode();
//    
//    override init() {
//        super.init()
//        automaticallyManagesSubnodes = true
//        backgroundColor = UIColor.style.background
//        back.backgroundColor = UIColor.white
//        back.cornerRadius = 8
//    }
//    
//    static func height(withWidth width: CGFloat) -> CGFloat {
//        let spacing = ForYouGroupNode.spacing
//        let top = ForYouGroupNode.backInset.top + ForYouGroupNode.contentInset.top
//        let left = ForYouGroupNode.backInset.left + ForYouGroupNode.contentInset.left
//        
//        let contentWidth = width - left * 2
//        
//        let unitW = (contentWidth - spacing * 2) / 5
//        return unitW * 3 + spacing + top * 2
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        
//        let contentInset = ForYouGroupNode.contentInset
//        let spacing = ForYouGroupNode.spacing
//        let backInset = ForYouGroupNode.backInset
//        
//        let contentWidth = constrainedSize.max.width - contentInset.left - contentInset.right
//        let contentHeight = constrainedSize.max.height - contentInset.top - contentInset.bottom
//        
//        let unitW = (contentWidth - spacing * 2) / 5
//        let unitH = (contentHeight - spacing) / 3
//        let ls = CGSize(width: 2 * unitW + spacing, height: 2 * unitH + spacing) //large size
//        let ss = CGSize(width: unitW, height: unitH) // small size
//        
//        let l0 = imgs[0]
//        let l1 = imgs[1]
//        let img0 = imgs[2]
//        let img1 = imgs[3]
//        let img2 = imgs[4]
//        let img3 = imgs[5]
//        let img4 = imgs[6]
//        let img5 = imgs[7]
//        let img6 = imgs[8]
//        
//        for i in 0..<2 {imgs[i].style.preferredSize = ls}
//        for i in 2..<9 {imgs[i].style.preferredSize = ss}
//        
//        let ver01 = ASStackLayoutSpec(direction: .vertical, spacing: spacing, justifyContent: .center, alignItems: .center, children: [img0, img1])
//        
//        let hor0 = ASStackLayoutSpec(direction: .horizontal, spacing: spacing, justifyContent: .center, alignItems: .center, children: [l0, ver01, l1])
//        
//        let hor1 = ASStackLayoutSpec(direction: .horizontal, spacing: spacing, justifyContent: .center, alignItems: .center, children: [img2, img3, img4, img5, img6])
//        
//        let ver = ASStackLayoutSpec(direction: .vertical, spacing: spacing, justifyContent: .center, alignItems: .center, children: [hor0, hor1])
//        
//        let b = ASInsetLayoutSpec(insets: backInset, child: back)
//        let bc = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: b)
//        
//        let c = ASInsetLayoutSpec(insets: contentInset, child: ver)
//        let cc = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: c)
//        
//        let r = ASWrapperLayoutSpec(layoutElements: [bc, cc])
//        
//        return r
//        
//    }
//}
