//
//  headlineAndButtonNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class headlineAndButtonNode: ASDisplayNode {
    
    let titleNode = ASTextNode()
    let button = ASButtonNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let titleSpec = ASRelativeLayoutSpec(horizontalPosition: .start, verticalPosition: .end, sizingOption: .minimumSize, child: titleNode)
        let buttonSpec = ASRelativeLayoutSpec(horizontalPosition: .end, verticalPosition: .end, sizingOption: .minimumSize, child: button)
        
        let rootSpec = ASWrapperLayoutSpec(layoutElements: [titleSpec, buttonSpec])
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16), child: rootSpec)
    }
}
