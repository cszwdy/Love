//
//  Image.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

struct Image: DisplayMediaModel {
    let id: String
    let src: URL
    let title: String
    let subtitle: String
    let type: MediaType = .image
    let tags: [TagModel]
    let width: Float
    let height: Float
    let imageAve: String
    
    var ratio: CGFloat {return CGFloat(height / width)}
}
