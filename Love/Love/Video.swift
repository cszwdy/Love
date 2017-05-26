//
//  Video.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct Video: DisplayMediaModel {
    
    let id: String
    let src: URL
    let title: String
    let subtitle: String
    var type: MediaType = .video
    let tags: [TagModel]
    let width: Float
    let height: Float
    let imageAve: String
}
