//
//  CellMaker.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import AsyncDisplayKit

enum PageType {
    case home
}

class NodeMaker {
    
    class func makeCell(by model: DisplayModel) -> ASCellNode {

        switch model {
        case let t as Image:
            let imgNode = FeedCellNode()
            imgNode.url = t.src
            imgNode.ratio = t.ratio
            imgNode.intro = t.title.theme.caption2
            return imgNode
        default:
            return ASCellNode()
        }
    }
}

var cacheHeight: [String: CGFloat] = [:]

extension NodeMaker {
    class func height(for model: DisplayModel, constraintWidth width: CGFloat, page: PageType) -> CGFloat {
        switch model {
        case let m as Image:
            
            if let h = cacheHeight[m.id] {
                return h
            } else {
                
                let ratio = m.height/m.width
                let imgH = width * CGFloat(ratio)
                let title = m.title.theme.caption2
                let textH = title.boundingRect(with: CGSize(width: width - 4*2, height: 10000), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil).size.height
                let height = imgH + textH + 4
                cacheHeight[m.id] = height
                return height
            }
            
        default:
            return 300
        }
    }
}

