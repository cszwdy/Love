//
//  String+Key.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

extension String {
    static var key: KeyBase<String> {return KeyBase(base: "")}
}

extension KeyBase where T==String {
    var domain:     URL {return URL(string:"http://i52hhb.natappfree.cc/AST_1.0/Public/")!}
    
    var login:      String {return "user.login"}
    var getContent: String {return "ucontent.getLabelContent"}
    
    var action:     String {return "act"}
    var account:    String {return "u_account"}
    var code:       String {return "u_code"}
    var tags:       String {return "labels"}
    var start:      String {return "start"}
    var size:       String {return "size"}
    var page:       String {return "page"}
    var pageSize:   String {return "pagesize"}
    
    var awesome:    String {return NSLocalizedString("awesome", comment: "")}
    var recommand:  String {return NSLocalizedString("recommand", comment: "")}
    var message:    String {return NSLocalizedString("message", comment: "")}
    var you:        String {return NSLocalizedString("you", comment: "")}
    var showAll:    String {return NSLocalizedString("showAll", comment: "")}
    var welfare:    String {return NSLocalizedString("welfare", comment: "")}
    var subscribe:  String {return NSLocalizedString("subscribe", comment: "")}
    var subscribed: String {return NSLocalizedString("subscribed", comment: "")}
}
