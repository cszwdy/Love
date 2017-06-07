//
//  TitleAndIntroNode.swift
//  Love
//
//  Created by Emiaostein on 31/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TitleAndIntroNode: ASDisplayNode {
    
    var titleText = NSAttributedString(string: "") {didSet {title.attributedText = titleText}}
    var introText = NSAttributedString(string: "") {didSet {intro.attributedText = introText}}
    
    private let title = ASTextNode()
    private let intro = ASTextNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let noTitle = title.attributedText?.string.isEmpty ?? true
        let noIntro = intro.attributedText?.string.isEmpty ?? true
        let children = noTitle && noIntro ? [] : (noTitle ? [intro] : [title])
        return ASStackLayoutSpec(direction: .vertical,
                                 spacing: 0,
                                 justifyContent: .start,
                                 alignItems: .start,
                                 children: children)
    }
}
