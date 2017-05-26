//
//  LargeImgNode.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class LargeImgNode: ASDisplayNode {
    let scrollNode = ASScrollNode()
    let imgNode = ASNetworkImageNode()
    
    override init() {
        super.init()
        scrollNode.automaticallyManagesSubnodes = true
//        scrollNode.automaticallyManagesContentSize = true
        scrollNode.layoutSpecBlock = {[weak self] (node, constrainedSize) -> ASLayoutSpec in
            self!.imgNode.style.preferredSize = CGSize(width: 1000, height: 1000)
            let rootSpec = ASWrapperLayoutSpec(layoutElement: self!.imgNode)
            return rootSpec
        }
        
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let insetLayout = ASInsetLayoutSpec(insets: .zero, child: scrollNode)
        return insetLayout
    }
    
}
