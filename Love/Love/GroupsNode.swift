//
//  GroupsNode.swift
//  Love
//
//  Created by Emiaostein on 31/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

enum GroupType {
    case one
    case four
    case nine
    case mosaic
    
    fileprivate func makeImgNodes() -> [ASNetworkImageNode] {
        switch self {
        case .one:
            return [ASNetworkImageNode()]
        case .four:
            return (0..<4).map{_ in return ASNetworkImageNode()}
        case .nine:
            return (0..<9).map{_ in return ASNetworkImageNode()}
        case .mosaic:
            return (0..<9).map{_ in return ASNetworkImageNode()}
        }
    }
    
    var itemSpacing: CGFloat {
        switch self {
        case .one: return 0
        case .four: return 2
        case .nine: return 5
        case .mosaic: return 4
        }
    }
    
    fileprivate var needMask: Bool {
        switch self {
        case .nine: return true
        default: return false
        }
    }
    
    fileprivate var clipBounds: Bool {
        switch self {
        case .nine: return true
        default: return false
            
        }
    }
}

class GroupsNode: ASDisplayNode {
    
    var type: GroupType {return _type}
    var urls: [URL] = []
    
    private let _imgNodes: [ASNetworkImageNode]
    private let _type: GroupType
    private let _mask: ASDisplayNode?
    
    init(type: GroupType) {
        _type = type
        _mask = _type.needMask ? ASDisplayNode() : nil
        _mask?.automaticallyManagesSubnodes = true
        _imgNodes = type.makeImgNodes()
        _imgNodes.forEach{$0.backgroundColor = UIColor.theme.minorBackwrad}
        super.init()
        automaticallyManagesSubnodes = true
        clipsToBounds = _type.clipBounds
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        switch _type {
        case .one:
            return _one(size: constrainedSize.max)
        case .four:
            return _four(size: constrainedSize.max)
        case .nine:
            return _nine(size: constrainedSize.max)
        case .mosaic:
            return _mosaic(size: constrainedSize.max)
        }
    }
    
    private func _setup(imgUrl: URL, imgNode: ASNetworkImageNode, imgNodeSize size: CGSize) {
        let imgH = Int(size.width * UIScreen.main.scale)
        let imgW = Int(size.width * UIScreen.main.scale)
        imgNode.setURL(imgUrl.makePreviewURL(by: .five(imgW, imgH)), resetToDefault: true)
    }
    
    private func _one(size: CGSize) -> ASLayoutSpec {
        _setup(imgUrl: urls[0], imgNode: _imgNodes[0], imgNodeSize: size)
        return ASInsetLayoutSpec(insets: .zero, child: _imgNodes[0])
    }
    
    private func _four(size: CGSize) -> ASLayoutSpec {
        let spacing = _type.itemSpacing
        let w = (size.width - spacing) / 2
        let h = (size.height - spacing) / 2
        for (i, node) in _imgNodes.enumerated() {
            let x = (spacing + w) * CGFloat(i % 2)
            let y = (spacing + h) * CGFloat(i / 2)
            node.style.layoutPosition = CGPoint(x: x, y: y)
            node.style.preferredSize = CGSize(width: w, height: h)
            
            if i < urls.count {
                _setup(imgUrl: urls[i], imgNode: node, imgNodeSize: CGSize(width: w, height: h))
            }
        }
        
        return ASStaticLayoutSpec(sizing: .default, children: _imgNodes)
    }
    
    private func _nine(size: CGSize) -> ASLayoutSpec {
        let spacing = _type.itemSpacing
        let w = (size.width - spacing * (3-1)) / 2
        let h = (size.height - spacing * (3-1)) / 2
        for (i, node) in _imgNodes.enumerated() {
            let x = -w/2 + (spacing + w) * CGFloat(i % 3)
            let y = -h/2 + (spacing + h) * CGFloat(i / 3)
            node.style.layoutPosition = CGPoint(x: x, y: y)
            node.style.preferredSize = CGSize(width: w, height: h)
            
            node.cornerRadius = 4
            
            if i < urls.count {
                _setup(imgUrl: urls[i], imgNode: node, imgNodeSize: CGSize(width: w, height: h))
            }
        }
        
        let imgNodes = _imgNodes
        let mask = _mask!
        mask.transform = CATransform3DMakeRotation((CGFloat(15.0/180.0*Double.pi)), 0, 0, 1)
        mask.style.preferredSize = CGSize(width: 3 * w + 2 + spacing, height: 3 * h + 2 * spacing)
        mask.style.layoutPosition = CGPoint(x: 0, y: 0)
        mask.layoutSpecBlock = {node, size in
            return ASAbsoluteLayoutSpec(sizing: .default, children: imgNodes)
        }
        
        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 0, bottom: -h/2, right: -w/2), child: mask)
    }
    
    private func _mosaic(size: CGSize) -> ASLayoutSpec {
        let spacing = _type.itemSpacing
        let w = (size.width - spacing * (3-1)) / 5
        let h = (size.height - spacing * (1)) / 3
        let lw = 2 * w + spacing
        let lh = 2 * h + spacing
        
        for (i, node) in _imgNodes.enumerated() {
            if i == 0 { // large
                node.style.layoutPosition = CGPoint(x: 0, y: 0)
                node.style.preferredSize = CGSize(width: lw, height: lh)
            } else if i == 1 { // large
                node.style.layoutPosition = CGPoint(x: lw + 2 * spacing + w, y: 0)
                node.style.preferredSize = CGSize(width: lw, height: lh)
            } else if i == 2 { // small vertical
                node.style.layoutPosition = CGPoint(x: lw + spacing, y: 0)
                node.style.preferredSize = CGSize(width: w, height: h)
            } else if i == 3 { // small vertical
                node.style.layoutPosition = CGPoint(x: lw + spacing, y: h + spacing)
                node.style.preferredSize = CGSize(width: w, height: h)
            } else {
                node.style.layoutPosition = CGPoint(x: (w + spacing) * CGFloat((i - 4) % 5), y: lh + spacing)
                node.style.preferredSize = CGSize(width: w, height: h)
            }
            
            node.cornerRadius = 4
            
            if i < urls.count {
                _setup(imgUrl: urls[i], imgNode: node, imgNodeSize: CGSize(width: w, height: h))
            }
        }
        
        return ASAbsoluteLayoutSpec(sizing: .default, children: _imgNodes)
    }
}
