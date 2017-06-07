////
////  TopicNode.swift
////  Love
////
////  Created by Emiaostein on 30/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import Foundation
//import AsyncDisplayKit
//
//final class TopicGroupNode: MediaNode {
//    
//    static let spacing: CGFloat = 5
//    static let inset = UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20)
//    
//    private let imgs: [ASNetworkImageNode] = {return (0..<9).map({ _ in
//        let n = ASNetworkImageNode()
//        n.cornerRadius = 4
//        n.backgroundColor = UIColor.style.background
//        return n
//    })}()
//    
//    let mask = ASDisplayNode()
//    let container = ASDisplayNode()
//    let title = ASTextNode()
//    let intro = ASTextNode()
//    
////    static func height(withWidth width: CGFloat) -> CGFloat {
////        
////        
////        
////    }
//    
//    override init() {
//        super.init()
//        automaticallyManagesSubnodes = true
//        mask.automaticallyManagesSubnodes = true
//        mask.cornerRadius = 8
////        clipsToBounds = true
//        mask.clipsToBounds = true
//        mask.borderColor = UIColor.style.background.cgColor
//        mask.borderWidth = 1
//        container.automaticallyManagesSubnodes = true
//        container.transform = CATransform3DMakeRotation(CGFloat(15.0/180.0*Double.pi), 0, 0, 1)
//        
//        title.attributedText = "Title".style.caption1
//        intro.attributedText = "What can i do for you ? May be you need my help!\nYou are the best!".style.caption2
//        
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let space = TopicGroupNode.spacing
//        let side = min(constrainedSize.max.height, constrainedSize.max.width)
//        let unitW = (side - space * 2) / 2
////        let unitW = (constrainedSize.max.width - space * 2) / 2
////        let unitH = (constrainedSize.max.height - space * 2) / 2
//        let unitH = unitW
//        container.layoutSpecBlock = {[weak self] node, size in
//            
//            for (i, img) in self!.imgs.enumerated() {
//                img.style.preferredSize = CGSize(width: unitW, height: unitH)
//                let x = -unitW / 2 + (unitW + space) * CGFloat(i % 3)
//                let y = -unitH / 2 + (unitH + space) * CGFloat(i / 3)
//                img.style.layoutPosition = CGPoint(x: x, y: y)
//            }
//            
//            let imgsSpec = ASAbsoluteLayoutSpec(children: self!.imgs)
//            return imgsSpec
//        }
//        
//        let containerSpec0 = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(0, 0, -unitW/2,-unitH/2), child: container)
//        
//        mask.layoutSpecBlock = { [weak self] node, size in
//            return ASWrapperLayoutSpec(layoutElement: containerSpec0)
//        }
//        
//        mask.style.preferredSize = CGSize(width: side, height: side)
//        container.style.preferredSize = CGSize(width: side, height: side)
//        
//        
//        let containerSpec = ASRatioLayoutSpec(ratio: 1, child: mask)
////        let rootSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: mask)
//        let rootSpec = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .start, children: [containerSpec, ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: title),ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: intro)])
//        
//        return rootSpec
//    }
//    
//}
