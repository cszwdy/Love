//
//  CenterFlowNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CenterFlowNode: ASDisplayNode {
    
    let centerFlowLayout = CenterFlowLayout()
    let collectionNode: ASCollectionNode
    
    override init() {
        centerFlowLayout.scrollDirection = .horizontal
        centerFlowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        collectionNode = ASCollectionNode(collectionViewLayout: centerFlowLayout)
        collectionNode.backgroundColor = UIColor.clear
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let width = constrainedSize.max.width - 16 * 2
        centerFlowLayout.itemSize = CGSize(width: width, height: constrainedSize.max.height)
        let rootSpec = ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: collectionNode)
        return rootSpec
    }
}
