////
////  ForYouHeadCellNode.swift
////  Love
////
////  Created by Emiaostein on 01/06/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class ForYouHeadCellNode: ASCellNode {
//    
//    private let date = ASTextNode()
//    private let title = ASTextNode()
//    private let inset = App.layout.discover.edgeSpacing
//    
//    override init() {
//        super.init()
//        automaticallyManagesSubnodes = true
//        separatorInset = UIEdgeInsets(top: 0, left: inset, bottom: 0, right: 0)
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        return ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .start, children: [date, title])
//    }
//}
