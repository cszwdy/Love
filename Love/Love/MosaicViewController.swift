//
//  MosaicViewController.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MosaicViewController: ASViewController<ASDisplayNode> {
    
    var canFetch = true
    var models: [DisplayModel] = []
    
    weak var mosaicNode: MosaicNode!
    weak var headNode: NavigationHeadNode?
    
    init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        node.theme.backgroundColor{_ in UIColor.theme.backward}
        
        let aheadNode = NavigationHeadNode()
        aheadNode.theme.backgroundColor{_ in return UIColor.theme.backward}
        aheadNode.titleNode.theme.attributeText{_ in return String.key.awesome.theme.LargeTitle}
        
        let amosaicNode = MosaicNode()
        amosaicNode.layoutInspector = self
        amosaicNode.layoutDelegate = self
        amosaicNode.delegate = self
        amosaicNode.dataSource = self
        
        node.layoutSpecBlock = {node, size in
            let insets =  UIEdgeInsets(top: 20, left: 0, bottom: 49, right: 0)
            let mosaicSpec = ASInsetLayoutSpec(insets: insets, child: amosaicNode)
            aheadNode.style.preferredSize = CGSize(width: size.max.width, height: 100)
            amosaicNode.contentInset.top = 100-20
            let rootSpec = ASAbsoluteLayoutSpec(children: [mosaicSpec, aheadNode])
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
        App.theme.add {[weak self] (light) in
            self?.setNeedsStatusBarAppearanceUpdate()
        }
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return App.theme.light ? UIStatusBarStyle.default : UIStatusBarStyle.lightContent
    }
}

extension MosaicViewController: ASCollectionViewLayoutInspecting {
    func collectionView(_ collectionView: ASCollectionView,
                        constrainedSizeForNodeAt
        indexPath: IndexPath) -> ASSizeRange {
        return ASSizeRange(min: CGSize.zero,
                           max: (collectionView.collectionViewLayout as! MosaicViewLayout).itemSize(at: indexPath))
    }
    
    func scrollableDirections() -> ASScrollDirection {
        return ASScrollDirectionVerticalDirections
    }
}

extension MosaicViewController: ASCollectionDataSource, ASCollectionDelegate {
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return  models.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let model = models[indexPath.item]
        let rootNode = NodeMaker.makeCell(by: model)
        func nodeMaker() -> ASCellNode {
            return rootNode
        }
        
        return nodeMaker
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        headNode?.frame.origin.y = min(0, -(mosaicNode.contentInset.top + y))
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
    }
    
    func shouldBatchFetch(for collectionNode: ASCollectionNode) -> Bool {
        return canFetch
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, willBeginBatchFetchWith context: ASBatchContext) {
        canFetch = false
        DispatchQueue.main.async {
            self.beginFetch(node: collectionNode, context: context) { [weak self] in
                self?.canFetch = true
                context.completeBatchFetching(true)
            }
        }
    }
    
    func beginFetch(node: ASCollectionNode,context: ASBatchContext, completed: @escaping ()->()) {
//        let start = models.count == 0 ? 1 : models.count
//        let items = Items(tags: [], start: [start], size: [20])
        
        let titles = ["如果你18岁还是处，你是个loser；但是如果你18岁就怀孕了，你还是个loser。",
                      "当我发现大多数运动员年纪都比我小的时候，我意识到自己老了。",
                      "如果地球上除了我以外的人都消失24小时，我估计会用这24小时去找他们。",
                      "外星人发现「地球表面 71% 都是水但很多人类竟然不会游泳」时可能会很惊讶。",
                      "养小孩就像手机，拥有的时间越长，越不会小心翼翼的怕弄坏了。", "","今天挺好。"]
        
        let jsonDemoURL = Bundle.main.url(forResource: "itemDemo", withExtension: "json")!
        let data = try! Data(contentsOf: jsonDemoURL)
        let dic = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
        let itemModel = ItemModel(json: dic)!
        var newModels = [DisplayModel]()
        for (i, item) in itemModel.result.items.enumerated() {
            newModels.append(Image(id: item.contentId,
                                   src: item.contentImgsrc,
                                   title: item.contentTitle.isEmpty ? titles[i % titles.count]:item.contentTitle,
                                   subtitle: "",
                                   tags: [],
                                   width: Float(item.imgWidth)!,
                                   height: Float(item.imgHeight)!,
                                   imageAve: item.imageAve)
            )
        }
        let i = models.count
        models.append(contentsOf: newModels)
        let newIndexPaths = (i..<i+newModels.count).map{IndexPath(item: $0, section: 0)}
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
           node.insertItems(at: newIndexPaths)
            completed()
        }
        
        
//        WebService.load(res: items.resource) {[weak self] (model) in
//            guard let ws = self, let itemModel = model, itemModel.result.items.count > 0 else {completed(); return}
//            
//            
//            var newModels = [DisplayModel]()
//            for item in itemModel.result.items {
//                newModels.append(Image(id: item.contentId,
//                                       src: item.contentImgsrc,
//                                       title: item.contentTitle.isEmpty ? titles[Int(arc4random())%titles.count]:item.contentTitle,
//                                       subtitle: "",
//                                       tags: [],
//                                       width: Float(item.imgWidth)!,
//                                       height: Float(item.imgHeight)!,
//                                       imageAve: item.imageAve)
//                )
//            }
//            let i = ws.models.count
//            ws.models.append(contentsOf: newModels)
//            let newIndexPaths = (i..<i+newModels.count).map{IndexPath(item: $0, section: 0)}
//            DispatchQueue.main.async {
//               node.insertItems(at: newIndexPaths)
//                completed()
//            }
//        }t
    }
}

extension MosaicViewController: MosaicViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: MosaicViewLayout, constraintWidth:CGFloat, heightAtIndexPath: IndexPath) -> CGFloat {
        let model = models[heightAtIndexPath.item]
        return NodeMaker.height(for: model, constraintWidth: constraintWidth, page: .home)
    }
}
