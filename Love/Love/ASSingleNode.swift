//
//  ASSingleNode.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ASSingleNode: ASCellNode {
    
    let imgNode = ASNetworkImageNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let insetLayout = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2), child: imgNode)
        return insetLayout
    }
}
