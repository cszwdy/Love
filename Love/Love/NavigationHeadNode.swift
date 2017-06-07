//
//  NavigationHeadNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NavigationHeadNode: ASDisplayNode {
    
    let titleNode = ASTextNode()
    let subtitleNide = ASTextNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        backgroundColor = UIColor.clear
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackSpec = ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .end, alignItems: .start, children: [subtitleNide, titleNode])
        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: CGFloat.infinity, left: 16, bottom: 16, right: 16), child: stackSpec)
        
        return insetSpec
    }
}
