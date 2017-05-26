//
//  UserModel.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct LoginModel {
    let msg: String
    let ret: Int
    struct Result {
        struct Info {
            let userId: String
            let userAge: String
            let userAccount: String
            let userGender: String
            let userPhone: String
            let userPwd: String
            init(userId: String, userAge: String, userAccount: String, userGender: String, userPhone: String, userPwd: String) {
                self.userId = userId
                self.userAge = userAge
                self.userAccount = userAccount
                self.userGender = userGender
                self.userPhone = userPhone
                self.userPwd = userPwd
            }
            init?(json: [String:Any]) {
                guard let userId = json["user_id"] as? String else { return nil }
                guard let userAge = json["user_age"] as? String else { return nil }
                guard let userAccount = json["user_account"] as? String else { return nil }
                guard let userGender = json["user_gender"] as? String else { return nil }
                guard let userPhone = json["user_phone"] as? String else { return nil }
                guard let userPwd = json["user_pwd"] as? String else { return nil }
                self.init(userId: userId, userAge: userAge, userAccount: userAccount, userGender: userGender, userPhone: userPhone, userPwd: userPwd)
            }
        }
        let info: Info
        let code: String
        let msg: String
        init(info: Info, code: String, msg: String) {
            self.info = info
            self.code = code
            self.msg = msg
        }
        init?(json: [String:Any]) {
            guard let infoJSONDictionary = json["info"] as? [String:Any] else { return nil }
            guard let info = Info(json: infoJSONDictionary) else { return nil }
            guard let code = json["code"] as? String else { return nil }
            guard let msg = json["msg"] as? String else { return nil }
            self.init(info: info, code: code, msg: msg)
        }
    }
    let result: Result
    init(msg: String, ret: Int, result: Result) {
        self.msg = msg
        self.ret = ret
        self.result = result
    }
    init?(json: [String:Any]) {
        guard let msg = json["msg"] as? String else { return nil }
        guard let ret = json["ret"] as? Int else { return nil }
        guard let resultJSONDictionary = json["result"] as? [String:Any] else { return nil }
        guard let result = Result(json: resultJSONDictionary) else { return nil }
        self.init(msg: msg, ret: ret, result: result)
    }
}
