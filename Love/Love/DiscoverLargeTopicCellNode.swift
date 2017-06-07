//
//  DiscoverTopicNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DiscoverLargeTopicCellNode: ASCellNode {
    
    let headNode = headlineAndButtonNode()
    let centerNode = CenterFlowNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes=true
        separatorInset = UIEdgeInsets.zero
        selectionStyle = .none
        headNode.titleNode.theme.attributeText{_ in return String.key.welfare.theme.headline}
        headNode.button.titleNode.theme.attributeText{_ in return String.key.showAll.theme.caption2}
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        headNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 55)
        centerNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: constrainedSize.max.height - 55)
        return ASStackLayoutSpec(direction: .vertical, spacing: 0, justifyContent: .start, alignItems: .center, children: [headNode, centerNode])
    }
}
