////
////  GroupNode.swift
////  Love
////
////  Created by Emiaostein on 25/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import Foundation
//import AsyncDisplayKit
//
//class GroupNode: MediaNode {
//    
//    private let preImgNodes = [ASNetworkImageNode(),ASNetworkImageNode(),ASNetworkImageNode(),ASNetworkImageNode()]
//    private let titleNode = ASTextNode()
//    private let subTitleNode = ASTextNode()
//    private let cornerImgNode = ASImageNode()
//    
//    var title = NSAttributedString(string: "") {didSet {titleNode.attributedText = title}}
//    var subtitle = NSAttributedString(string: "") {didSet {subTitleNode.attributedText = subtitle}}
//    var cornerImg: UIImage? {
//        didSet {cornerImgNode.image = cornerImg}
//    }
//    var urls: [URL] = [] {
//        didSet {
//            for (i, u) in urls.enumerated() {
//                preImgNodes[i].setURL(u, resetToDefault: true)
//            }
//        }
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        
//        let r = preImgNodes.map{ (a) -> (ASNetworkImageNode) in a.style.preferredSize = CGSize(width: constrainedSize.max.width/2.0, height: constrainedSize.max.width/2.0); return a}
//        
//        let lv = ASStackLayoutSpec(
//            direction: .vertical,
//            spacing: 1,
//            justifyContent: .center,
//            alignItems: .center,
//            children: [r[0], r[1]])
//        
//        let rv = ASStackLayoutSpec(
//            direction: .vertical,
//            spacing: 1,
//            justifyContent: .center,
//            alignItems: .center,
//            children: [r[2], r[3]])
//        
//        let h = ASStackLayoutSpec(
//            direction: .horizontal,
//            spacing: 1,
//            justifyContent: .center,
//            alignItems: .center,
//            children: [lv, rv])
//        
//        let o = ASOverlayLayoutSpec(child: h, overlay: cornerImgNode)
//        
//        let v = ASStackLayoutSpec(
//            direction: .vertical,
//            spacing: 0,
//            justifyContent: .start,
//            alignItems: .start,
//            children: [o, titleNode, subTitleNode])
//        
//        
//        return v
//    }
//    
//}
