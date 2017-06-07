//
//  mosaicNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MosaicNode: ASDisplayNode {
    
    var layoutDelegate: MosaicViewLayoutDelegate? {
        set{mosaicLayout.delegate = newValue}
        get{return mosaicLayout.delegate}
    }
    
    var layoutInspector: ASCollectionViewLayoutInspecting? {
        set{collectionNode.view.layoutInspector = newValue}
        get{return collectionNode.view.layoutInspector}
    }
    
    var dataSource: ASCollectionDataSource? {
        set{collectionNode.dataSource = newValue}
        get{return collectionNode.dataSource}
    }
    
    var delegate: ASCollectionDelegate? {
        set{collectionNode.delegate = newValue}
        get{return collectionNode.delegate}
    }
    
    var contentInset = UIEdgeInsets.zero {didSet{collectionNode.view.contentInset = contentInset}}
    let mosaicLayout = MosaicViewLayout()
    let collectionNode: ASCollectionNode!
    
    override init() {
        collectionNode = ASCollectionNode(collectionViewLayout: mosaicLayout)
        collectionNode.backgroundColor = UIColor.clear
        super.init()
        automaticallyManagesSubnodes = true
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: collectionNode)
    }
}
