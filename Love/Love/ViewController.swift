//
//  ViewController.swift
//  Love
//
//  Created by Emiaostein on 04/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ViewController: ASViewController<ASCollectionNode> {
    
    init() {
        super.init(node: ASCollectionNode(frame: CGRect.zero, collectionViewLayout: MosaicCollectionViewLayout()))
        self.node.dataSource = self
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension ViewController: ASCollectionDataSource {
    func numberOfSections(in collectionNode: ASCollectionNode) -> Int {
        return 1
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        func nodeMaker() -> ASCellNode {
            
            let cell = ASCellNode()
            cell.style.preferredSize = CGSize(width: 100, height: 100)
            cell.backgroundColor = UIColor.lightGray
            return cell
        }
        
        return nodeMaker
    }
    
    
    
}

