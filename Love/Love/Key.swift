//
//  Key.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

struct KeyBase<T> {
    let base: T
}

protocol Key {
    associatedtype B = KeyBase<Self>
    var key: B {get}
}

extension Key {
    var key: KeyBase<Self> {return KeyBase(base: self)}
    
}
