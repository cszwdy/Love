//
//  FeedCellNode.swift
//  Love
//
//  Created by Emiaostein on 01/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class FeedCellNode: ASCellNode {
    
    var ratio: CGFloat = 1.0
    var url: URL? {didSet {if let url = url {group.urls = [url]}}}
    var intro = NSAttributedString(string: "") {didSet{text.introText = intro}}
    
    private let group: GroupsNode
    private let text = TitleAndIntroNode()
    private let corner = ASImageNode()
    
    override init() {
        group = GroupsNode(type: .one)
        super.init()
        automaticallyManagesSubnodes = true
        corner.theme.image{light in return (light ? #imageLiteral(resourceName: "corner4-light") : #imageLiteral(resourceName: "corner4-dark")).stretchableImage(withLeftCapWidth: 4, topCapHeight: 4)}
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let groupSpec = ASOverlayLayoutSpec(child: ASRatioLayoutSpec(ratio: ratio, child: group), overlay: corner)
        let textSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 4, bottom: 0, right: 4), child: text)
        
        let rootSpec = ASStackLayoutSpec(direction: .vertical, spacing: 4, justifyContent: .start, alignItems: .start, children: [groupSpec, textSpec])
        return rootSpec
    }

}
