//
//  ItemModel.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct ItemModel {
    struct Result {
        let msg: String
        struct Item {
            let contentId: String
            let imageAve: String
            struct Label {
                let labelTitle: String
                let labelId: String
                let labelLikeNum: String
                init(labelTitle: String, labelId: String, labelLikeNum: String) {
                    self.labelTitle = labelTitle
                    self.labelId = labelId
                    self.labelLikeNum = labelLikeNum
                }
                init?(json: [String: Any]) {
                    guard let labelTitle = json["label_title"] as? String else { return nil }
                    guard let labelId = json["label_id"] as? String else { return nil }
                    guard let labelLikeNum = json["label_likeNum"] as? String else { return nil }
                    self.init(labelTitle: labelTitle, labelId: labelId, labelLikeNum: labelLikeNum)
                }
            }
            let labels: [Label]
            let imgHeight: String
            let contentTitle: String
            let contentImgsrc: URL
            let imgWidth: String
            let contentSmallImgSrc: String
            init(contentId: String, imageAve: String, labels: [Label], imgHeight: String, contentTitle: String, contentImgsrc: URL, imgWidth: String, contentSmallImgSrc: String) {
                self.contentId = contentId
                self.imageAve = imageAve
                self.labels = labels
                self.imgHeight = imgHeight
                self.contentTitle = contentTitle
                self.contentImgsrc = contentImgsrc
                self.imgWidth = imgWidth
                self.contentSmallImgSrc = contentSmallImgSrc
            }
            init?(json: [String: Any]) {
                guard let contentId = json["content_id"] as? String else { return nil }
                guard let imageAve = json["imageAve"] as? String else { return nil }
                guard let labelsJSONArray = json["labels"] as? [[String: Any]] else { return nil }
                let labels = labelsJSONArray.map({ Label(json: $0) }).flatMap({ $0 })
                guard let imgHeight = json["img_height"] as? String else { return nil }
                guard let contentTitle = json["content_title"] as? String else { return nil }
                guard let contentImgsrcString = json["content_imgsrc"] as? String else { return nil }
                guard let contentImgsrc = URL(string: contentImgsrcString) else { return nil }
                guard let imgWidth = json["img_width"] as? String else { return nil }
                guard let contentSmallImgSrc = json["content_smallImgSrc"] as? String else { return nil }
                self.init(contentId: contentId, imageAve: imageAve, labels: labels, imgHeight: imgHeight, contentTitle: contentTitle, contentImgsrc: contentImgsrc, imgWidth: imgWidth, contentSmallImgSrc: contentSmallImgSrc)
            }
        }
        let items: [Item]
        struct PageModel {
            let pagesize: String
            let page: String
            init(pagesize: String, page: String) {
                self.pagesize = pagesize
                self.page = page
            }
            init?(json: [String: Any]) {
                guard let pagesize = json["pagesize"] as? String else { return nil }
                guard let page = json["page"] as? String else { return nil }
                self.init(pagesize: pagesize, page: page)
            }
        }
        let pageModel: PageModel
        let code: String
        init(msg: String, items: [Item], pageModel: PageModel, code: String) {
            self.msg = msg
            self.items = items
            self.pageModel = pageModel
            self.code = code
        }
        init?(json: [String: Any]) {
            guard let msg = json["msg"] as? String else { return nil }
            guard let itemsJSONArray = json["info"] as? [[String: Any]] else { return nil }
            let items = itemsJSONArray.map({ Item(json: $0) }).flatMap({ $0 })
            guard let pageModelJSONDictionary = json["pageModel"] as? [String: Any] else { return nil }
            guard let pageModel = PageModel(json: pageModelJSONDictionary) else { return nil }
            guard let code = json["code"] as? String else { return nil }
            self.init(msg: msg, items: items, pageModel: pageModel, code: code)
        }
    }
    let result: Result
    let msg: String
    let ret: Int
    init(result: Result, msg: String, ret: Int) {
        self.result = result
        self.msg = msg
        self.ret = ret
    }
    init?(json: [String: Any]) {
        guard let resultJSONDictionary = json["result"] as? [String: Any] else { return nil }
        guard let result = Result(json: resultJSONDictionary) else { return nil }
        guard let msg = json["msg"] as? String else { return nil }
        guard let ret = json["ret"] as? Int else { return nil }
        self.init(result: result, msg: msg, ret: ret)
    }
}
