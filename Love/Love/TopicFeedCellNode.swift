//
//  TopicFeedCellNode.swift
//  Love
//
//  Created by Emiaostein on 01/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class TopicFeedCellNode: ASCellNode {
    
    var subscribed = false {didSet {updateButtonStatus(enabled: subscribed)}}
    var urls: [URL] = [] {didSet{group.urls = urls}}
    var title = NSAttributedString(string: "") {didSet{text.titleText = title}}
    var intro = NSAttributedString(string: "") {didSet{text.introText = intro}}
    
    private let group: GroupsNode
    private let text = TitleAndIntroNode()
    private let button = ASButtonNode()
    private let corner = ASImageNode()
    
    init(type: GroupType) {
        group = GroupsNode(type: type)
        super.init()
        automaticallyManagesSubnodes = true
        corner.theme.image{light in return (light ? #imageLiteral(resourceName: "corner4-light"):#imageLiteral(resourceName: "corner4-dark")).stretchableImage(withLeftCapWidth: 4, topCapHeight: 4)}
        button.cornerRadius = 4
        updateButtonStatus(enabled: subscribed)
        selectionStyle = .none
    }
    
    func updateButtonStatus(enabled: Bool) {
        button.setAttributedTitle((enabled ? String.key.subscribe : String.key.subscribed).theme.headline , for: .normal)
        button.backgroundColor = enabled ? UIColor.theme.tint : UIColor.theme.minorBackwrad
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        if group.type == .mosaic {
            let background = ASDisplayNode()
            background.cornerRadius = 8
            background.theme.backgroundColor{_ in UIColor.theme.backward}
            let bi: CGFloat = 16
            let gi: CGFloat = bi + 16
            let backSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: ASInsetLayoutSpec(insets: UIEdgeInsets(top: bi, left: bi, bottom: bi, right: bi), child: background))
            let groupSpec = ASCenterLayoutSpec(centeringOptions: .XY, sizingOptions: .minimumXY, child: ASInsetLayoutSpec(insets: UIEdgeInsets(top: gi, left: gi, bottom: gi, right: gi), child: group))
            return ASAbsoluteLayoutSpec(sizing: .default, children: [backSpec, groupSpec])
            
        } else {
            button.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 30)
            
            let groupSpec = ASOverlayLayoutSpec(child: ASRatioLayoutSpec(ratio: 1.0, child: group), overlay: corner)
            let textSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: text)
            let buttonSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: button)
            
            let rootSpec = ASStackLayoutSpec(direction: .vertical, spacing: 5, justifyContent: .start, alignItems: .start, children: [groupSpec, textSpec, buttonSpec])
            return rootSpec
        }
    }
}
