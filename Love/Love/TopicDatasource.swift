//
//  TopicDatasource.swift
//  Love
//
//  Created by Emiaostein on 31/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import AsyncDisplayKit

class TopicDatasource: NSObject, ASCollectionDataSource {
    
    var n = 10
    
    func collectionNode(_ collectionNode: ASCollectionNode, numberOfItemsInSection section: Int) -> Int {
        return n
    }
    
    func collectionNode(_ collectionNode: ASCollectionNode, nodeBlockForItemAt indexPath: IndexPath) -> ASCellNodeBlock {
        
        return {
            let cell = TopicFeedCellNode(type: .nine)
            return cell
        }
    }
}
