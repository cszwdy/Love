//
//  DisplayModel.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

enum MediaType {
    case image, video
}

protocol TagModel {
    var id: String {get}
    var name: String {get}
}

protocol DisplayModel {
    var id: String {get}
}

protocol DisplayMediaModel: DisplayModel {
    
    
    var src: URL {get}
    var title: String {get}
    var subtitle: String {get}
    var width: Float {get}
    var height: Float {get}
    var imageAve: String {get}
    var type: MediaType {get}
    var tags: [TagModel] {get}
}

protocol DisplayGroupModel: DisplayModel {
    var medias: [DisplayMediaModel] {get}
}

