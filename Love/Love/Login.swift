//
//  Login.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct Login {
    let account: String
    let code: String
}

extension Login: Epsidoe {
    var resource: Resource<LoginModel> { return Resource(url: url, httpMethod: .post(parameters), parseJSON: LoginModel.init)}
    var parameters: JSONParemeter { return [
        App.key.para.action: App.key.action.login,
        App.key.para.account:"\(account)" ,
        App.key.para.verifiedCode:"\(code)"]
    }
}
