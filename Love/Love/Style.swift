//
//  Style.swift
//  asb
//
//  Created by Emiaostein on 03/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

// Text
struct StyleBase<T> {
    let base: T
}

protocol Style {
    associatedtype B = StyleBase<Self>
    var style: B {get}
}

extension Style {
    var style: StyleBase<Self> {return StyleBase(base: self)}
}

