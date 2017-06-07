//
//  CenterViewController.swift
//  Love
//
//  Created by Emiaostein on 29/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class CenterViewController: ASViewController<ASDisplayNode> {
    
    fileprivate var models: [DisplayModel] = []
    weak var headNode: NavigationHeadNode!
    weak var mosaicNode: MosaicNode!
//    weak var segmentNode: SegmentNode!
    weak var asegmentView: UIView!
    
    init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.theme.backgroundColor{_ in return UIColor.theme.backward}
        let aheadNode = NavigationHeadNode()
        aheadNode.titleNode.theme.attributeText{_ in String.key.you.theme.LargeTitle}
        
        let amosaicNode = MosaicNode()
        amosaicNode.layoutInspector = self
        amosaicNode.layoutDelegate = self
        amosaicNode.delegate = self
        amosaicNode.dataSource = self
        
        node.layoutSpecBlock = {node, size in
            let mosaicSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 20, left: 0, bottom: 49, right: 0), child: amosaicNode)
            aheadNode.style.preferredSize = CGSize(width: size.max.width, height: 100)
            amosaicNode.contentInset.top = 100-20+88
            let rootSpec = ASAbsoluteLayoutSpec(children: [mosaicSpec,aheadNode])
            return rootSpec
        }
        
        mosaicNode = amosaicNode
        headNode = aheadNode
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let segmentView = UIView(frame: CGRect(x: 0, y: 100, width: view.bounds.width, height: 88))
        let segment = UISegmentedControl(items: ["订阅", "喜欢"])
        
        segment.frame = CGRect(x: 16, y: 16, width: 200, height: 44)
        segment.selectedSegmentIndex = 0
//        segment.tintColor = UIColor.black
        let count = segment.numberOfSegments
        segment.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.black], for: .normal)
        segment.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17),NSForegroundColorAttributeName: UIColor.black], for: .selected)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .selected, barMetrics: .default)
        segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.backward, count: count, size: CGSize(width: 200, height: 44)), for: .normal, barMetrics: .default)
        segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.backward, count: count, size: CGSize(width: 200, height: 44)), for: .highlighted, barMetrics: .default)
        segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.minorBackwrad, count: count, size: CGSize(width: 200, height: 44)), for: .selected, barMetrics: .default)
        
                App.theme.add {[weak self] (light) in
                    self?.setNeedsStatusBarAppearanceUpdate()
                    segment.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.white], for: .normal)
                    segment.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17),NSForegroundColorAttributeName: UIColor.white], for: .selected)
                    segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
                    segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
                    segment.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .selected, barMetrics: .default)
                    segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.backward, count: count, size: CGSize(width: 200, height: 44)), for: .normal, barMetrics: .default)
                    segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.backward, count: count, size: CGSize(width: 200, height: 44)), for: .highlighted, barMetrics: .default)
                    segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.minorBackwrad, count: count, size: CGSize(width: 200, height: 44)), for: .selected, barMetrics: .default)
        
                }
        segmentView.addSubview(segment)
        view.addSubview(segmentView)
        
        asegmentView = segmentView
        
//        mosaicNode.collectionNode.view.contentSize = CGSize(width: 375, height: 10000)
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return App.theme.light ? UIStatusBarStyle.default : UIStatusBarStyle.lightContent
    }
}

extension CenterViewController: ASCollectionDataSource {
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
}

extension CenterViewController: ASCollectionDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        headNode.frame.origin.y = min(0, -(scrollView.contentInset.top + y))
        asegmentView.frame.origin.y = max(min(100, 100-(scrollView.contentInset.top + y)), 20)
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
//        let model = models[indexPath.item]
//        let rootNode = NodeMaker.makeCell(by: model)
        func nodeMaker() -> ASCellNode {
            return ASCellNode()
        }
        
        return nodeMaker
    }
}

extension CenterViewController: MosaicViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: MosaicViewLayout, constraintWidth:CGFloat, heightAtIndexPath: IndexPath) -> CGFloat {
        return 400
        //let model = models[heightAtIndexPath.item]
       // return NodeMaker.height(for: model, constraintWidth: constraintWidth, page: .home)
    }
}

extension CenterViewController: ASCollectionViewLayoutInspecting {
    func collectionView(_ collectionView: ASCollectionView, constrainedSizeForNodeAt indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize.zero, max: (collectionView.collectionViewLayout as! MosaicViewLayout).itemSize(at: indexPath))
    }
    
    func scrollableDirections() -> ASScrollDirection {
        return ASScrollDirectionVerticalDirections
    }
}
