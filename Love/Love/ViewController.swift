////
////  ViewController.swift
////  Love
////
////  Created by Emiaostein on 04/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class ViewController: ASViewController<ASCollectionNode> {
//    
//    init() {
//        super.init(node: ASCollectionNode(frame: CGRect.zero, collectionViewLayout: MosaicViewLayout()))
//        self.node.dataSource = self
//        self.node.delegate = self
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    var itemModel: ItemModel?
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
////        let items = Items(tags: [], start: [1], size: [10])
//        
////        WebService.load(res: items.resource) {[weak self] (model) in
////            guard let ws = self, let itemModel = model else {return}
////            ws.itemModel = itemModel
////            DispatchQueue.main.async {
////                ws.node.reloadData()
////            }
////        }
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//}
//
//extension ViewController: ASCollectionDataSource {
//    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
//        return 1
//    }
//    
//    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
//        return itemModel?.result.items.count ?? 10
//    }
//    
//    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
//        
//        let imgUrl = itemModel?.result.items[indexPath.item].contentImgsrc
//        func nodeMaker() -> ASCellNode {
//            if imgUrl == nil {
//                let cell = ASCellNode()
//                cell.backgroundColor = UIColor(red:0.91, green:0.92, blue:0.93, alpha:1.00)
//                return cell
//            } else {
//                let cell = ASSingleNode()
//                cell.imgNode.setURL(imgUrl?.makePreviewURL(by: .one(-1, 400)), resetToDefault: false)
//                cell.backgroundColor = UIColor(red:0.91, green:0.92, blue:0.93, alpha:1.00)
//                return cell
//            }
//        }
//        
//        return nodeMaker
//    }
//}
//
//extension ViewController: ASCollectionDelegate {
//    func collectionNode(_ collectionNode: ASCollectionNode, didSelectItemAt indexPath: IndexPath) {
//        if let imgUrl = URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-106-lrg.jpg") {
//            let detailVC = DetailSingleViewController()
//            detailVC.imgURL = imgUrl
//            present(detailVC, animated: true, completion: nil)
//        }
//    }
//}
//
