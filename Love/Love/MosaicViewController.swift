//
//  MosaicViewController.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class MosaicViewController: ASViewController<ASCollectionNode> {
    
    var models: [DisplayModel] = []
    var canFetch = true
    
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(node: ASCollectionNode(frame: CGRect.zero, collectionViewLayout: layout))
        layout.minimumLineSpacing = 26
//        layout.delegate = self
        node.dataSource = self
        node.delegate = self
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension MosaicViewController: ASCollectionDataSource, ASCollectionDelegate {
    
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return  models.count
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        let model = models[indexPath.item]
        let rootNode = NodeMaker.makeCell(by: model)
        func nodeMaker() -> ASCellNode {
            let cell = ASCellNode()
            cell.automaticallyManagesSubnodes = true
                        cell.layoutSpecBlock = {node, size in
                            let rootSpec = ASInsetLayoutSpec(insets: UIEdgeInsetsMake(16, 16, 0, 16), child: rootNode)
                            return rootSpec
                        }
            return cell
        }
        
        return nodeMaker
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
        if let img = models[indexPath.item] as? Image {
            let detail = DetailSingleViewController()
            detail.imgURL = img.src
            if let imgNode = collectionNode.nodeForItem(at: indexPath)?.subnodes[0] as? ImageNode {
                detail.holderImg = imgNode.img
            }
            
            detail.imgSize = CGSize(width: CGFloat(img.width), height: CGFloat(img.height))
            present(detail, animated: true, completion: nil)
        }
        
        
    }
    
    func shouldBatchFetch(for collectionNode: ASCollectionNode) -> Bool {
        return canFetch
    }
//
    
    func collectionNode(_ collectionNode: ASCollectionNode, willBeginBatchFetchWith context: ASBatchContext) {
        canFetch = false
        beginFetch(node: collectionNode, context: context) { [weak self] in
            self?.canFetch = true
            context.completeBatchFetching(true)
        }
    }
    
    func beginFetch(node: ASCollectionNode,context: ASBatchContext, completed: @escaping ()->()) {
        
        let start = models.count == 0 ? 1 : models.count
        let items = Items(tags: [], start: [start], size: [20])
        
        let titles = ["如果你18岁还是处，你是个loser；但是如果你18岁就怀孕了，你还是个loser。",
                      "当我发现大多数运动员年纪都比我小的时候，我意识到自己老了。",
                      "如果地球上除了我以外的人都消失24小时，我估计会用这24小时去找他们。",
                      "外星人发现「地球表面 71% 都是水但很多人类竟然不会游泳」时可能会很惊讶。",
                      "养小孩就像手机，拥有的时间越长，越不会小心翼翼的怕弄坏了。"]
        
//        let jsonDemoURL = Bundle.main.url(forResource: "itemDemo", withExtension: "json")!
//        let data = try! Data(contentsOf: jsonDemoURL)
//        let dic = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//        let itemModel = ItemModel(json: dic)!
//        var newModels = [DisplayModel]()
//        for item in itemModel.result.items {
//            newModels.append(Image(id: item.contentId,
//                                   src: item.contentImgsrc,
//                                   title: item.contentTitle.isEmpty ? titles[Int(arc4random())%titles.count]:item.contentTitle,
//                                   subtitle: "",
//                                   tags: [],
//                                   width: Float(item.imgWidth)!,
//                                   height: Float(item.imgHeight)!,
//                                   imageAve: item.imageAve)
//            )
//        }
//        let i = models.count
//        models.append(contentsOf: newModels)
//        let newIndexPaths = (i..<i+newModels.count).map{IndexPath(item: $0, section: 0)}
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 1) {
//           node.insertItems(at: newIndexPaths)
//            completed()
//        }
        
        
        WebService.load(res: items.resource) {[weak self] (model) in
            guard let ws = self, let itemModel = model, itemModel.result.items.count > 0 else {completed(); return}
            
            
            var newModels = [DisplayModel]()
            for item in itemModel.result.items {
                newModels.append(Image(id: item.contentId,
                                       src: item.contentImgsrc,
                                       title: item.contentTitle.isEmpty ? titles[Int(arc4random())%titles.count]:item.contentTitle,
                                       subtitle: "",
                                       tags: [],
                                       width: Float(item.imgWidth)!,
                                       height: Float(item.imgHeight)!,
                                       imageAve: item.imageAve)
                )
            }
            let i = ws.models.count
            ws.models.append(contentsOf: newModels)
            let newIndexPaths = (i..<i+newModels.count).map{IndexPath(item: $0, section: 0)}
            DispatchQueue.main.async {
               node.insertItems(at: newIndexPaths)
                completed()
            }
        }
    }
}

extension MosaicViewController: MosaicViewLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, layout: MosaicViewLayout, constraintWidth:CGFloat, heightAtIndexPath: IndexPath) -> CGFloat {
        
        let model = models[heightAtIndexPath.item]
        return NodeMaker.height(for: model, constraintWidth: constraintWidth, page: .home)
    }
}
