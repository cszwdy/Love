//
//  APIKey.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct App {
    
}

extension App {
    
    struct url {
        static let domain = URL(string:"http://i52hhb.natappfree.cc/AST_1.0/Public/")!
    }
    
    struct key {
        struct action {
            
            static let login = "user.login"
            static let getContent = "content.getLabelContent"
        }
        
        struct para {
            static let action = "act"
            static let account = "u_account"
            static let verifiedCode = "u_code"
            static let tags = "labels"
            static let start = "start"
            static let size = "size"
            static let page = "page"
            static let pageSize = "pagesize"
        }
    }

}

