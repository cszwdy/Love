//
//  Items.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
// http://e4aytp.natappfree.cc/AST_1.0/Public/?act=content.getLabelContent&labels=118,119&page=1&pagesize=3
struct Items {
    let tags: [String]
    let start: [Int]
    let size: [Int]
    
    init(tags:[String], start:[Int], size:[Int]) {
        self.tags = tags
        self.start = start.count > 0 ? start : [0]
        self.size = size.count > 0 ? size : [20]
    }
}

extension Items: Epsidoe {
    var parameters: JSONParemeter {
        if tags.count <= 0 {
            return [
                App.key.para.action: App.key.action.getContent,
                App.key.para.page: "\(start[0])",
                App.key.para.pageSize: "\(size[0])"
            ]
        } else {
            
            return [
                App.key.para.action: App.key.action.getContent,
                App.key.para.tags: tags.paraStr,
                App.key.para.start: start.paraStr,
                App.key.para.size: size.paraStr
            ]
        }
    }
    var resource: Resource<ItemModel> { return Resource(url: url, httpMethod: .getDemo(parameters), parseJSON: ItemModel.init)}
}

extension Array {
    var paraStr: String {
        var str = reduce(""){$0.0+",\($0.1)"}
        str.remove(at: str.startIndex)
        return str
    }
}
