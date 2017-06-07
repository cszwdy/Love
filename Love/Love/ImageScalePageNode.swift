//
//  ImageScalePageNode.swift
//  Love
//
//  Created by Emiaostein on 07/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ImageScalePageNode: ASDisplayNode {
    
    let pageNode = ASPagerNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        pageNode.setDataSource(self)
    }
    
    override func layoutSpecThatFits(
        _ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: pageNode)
    }
    
}

extension ImageScalePageNode: ASPagerDataSource {
    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
        return 10
    }
    
    func pagerNode(_ pagerNode: ASPagerNode,
                   nodeBlockAt index: Int) -> ASCellNodeBlock {
        return {
            let imgScaleNode = ImageScaleNode()
            let cellNode = ASCellNode()
            cellNode.addSubnode(imgScaleNode)
            cellNode.layoutSpecBlock = {node, size in
                return ASInsetLayoutSpec(insets: .zero, child: imgScaleNode)
            }
            return cellNode
        }
    }
}
