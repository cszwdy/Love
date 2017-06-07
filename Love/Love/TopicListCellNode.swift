//
//  TopicListCellNode.swift
//  Love
//
//  Created by Emiaostein on 01/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//
//
//import UIKit
//import AsyncDisplayKit
//
//class TopicListCellNode: ASCellNode {
//    
//    let collectionNode: ASCollectionNode
//    weak var centerLayout: CenterFlowLayout!
//    
//    override init() {
//        centerLayout = CenterFlowLayout()
//        collectionNode = ASCollectionNode(collectionViewLayout: centerLayout)
//        super.init()
//        automaticallyManagesSubnodes = true
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let top: CGFloat = 10
//        let left = App.layout.discover.edgeSpacing
//        let topInset = UIEdgeInsets(top: 0, left: left, bottom: top, right: left)
//        let titleSpec = ASInsetLayoutSpec(insets: topInset, child: title)
//    }
//    
//    
//}
