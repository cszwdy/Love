//
//  Group.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct Group: DisplayGroupModel {
    let id: String
    let medias: [DisplayMediaModel]
    var tags: [TagModel] {return medias.flatMap{$0.tags}}
}
