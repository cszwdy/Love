//
//  DiscoverViewController.swift
//  Love
//
//  Created by Emiaostein on 29/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

//fileprivate let edgeSpacing = App.layout.discover.edgeSpacing

class DiscoverViewController: ASViewController<ASDisplayNode> {
    
    weak var headNode: NavigationHeadNode!
    weak var tableNode: ASTableNode!
    
    let dataSource = TopicDatasource()
    let sections = ["foryou", "topics"]
    
    init() {
        super.init(node: ASDisplayNode())
        node.theme.backgroundColor{_ in UIColor.theme.backward}
        node.automaticallyManagesSubnodes = true
        
        let aheadNode = NavigationHeadNode()
        aheadNode.theme.backgroundColor{_ in return UIColor.theme.backward}
        aheadNode.subtitleNide.theme.attributeText{_ in return "星期一，2017年6月4日".theme.largeCaption2}
        aheadNode.titleNode.theme.attributeText{_ in return String.key.recommand.theme.LargeTitle}
        
        let atableNode = ASTableNode()
        atableNode.backgroundColor = UIColor.clear
        atableNode.dataSource = self
        atableNode.delegate = self
        
        node.layoutSpecBlock = { node, size in
            let tableSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(20, 0, 49, 0), child: atableNode)
            aheadNode.style.preferredSize = CGSize(width: size.max.width, height: 100)
            atableNode.view.contentInset.top = 100-20
            let rootSpec = ASAbsoluteLayoutSpec(children: [tableSpec, aheadNode])
            return rootSpec
        }

        headNode = aheadNode
        tableNode = atableNode
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        tableNode.closestViewController
        tableNode.view.separatorStyle = .none
        App.theme.add {[weak self] (light) in
            self?.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return App.theme.light ? UIStatusBarStyle.default : UIStatusBarStyle.lightContent
    }
}

extension DiscoverViewController: ASTableDataSource {
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return sections.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let i = indexPath.item
        return {[weak self] in
            switch i {
            case 0:
                let foryou = TopicFeedCellNode(type: .mosaic)
//                foryou.separatorInset = UIEdgeInsets(top: 0.5, left: 16, bottom: 0, right: 16)
                foryou.theme.backgroundColor{_ in UIColor.theme.minorBackwrad}
                return foryou
                
            case 1:
                let discover = DiscoverLargeTopicCellNode()
                discover.centerNode.collectionNode.dataSource = self!.dataSource
                return discover
                
            default:
                return ASCellNode()
            }
        }
    }
}
//
extension DiscoverViewController: ASTableDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        headNode?.frame.origin.y = min(0, -(scrollView.contentInset.top + y))
    }
    
    func tableNode(_ table2Node: ASTableNode, constrainedSizeForRowAt indexPath: IndexPath) -> ASSizeRange {
        
        let width = tableNode.view.bounds.width
        let height: CGFloat
        switch indexPath.item {
        case 0:
            height = (width-16*2)/3*2
        case 1:
            
            height = 480
        case 2:
            height = 480
            
        default:
            height = CGFloat.infinity
        }
        
        return ASSizeRange(min: CGSize.zero, max: CGSize(width: width, height: height))
        
    }
    
}
//
////extension DiscoverViewController: ASCollectionViewLayoutInspecting {
////    func collectionView(_ collectionView: ASCollectionView, constrainedSizeForNodeAt indexPath: IndexPath) -> ASSizeRange {
////        return ASSizeRange(min: CGSize.zero, max: CGSize(width: collectionView.bounds.width, height: collectionView.bounds.width))
////    }
////    
////    func scrollableDirections() -> ASScrollDirection {
////        return ASScrollDirectionVerticalDirections
////    }
//}
