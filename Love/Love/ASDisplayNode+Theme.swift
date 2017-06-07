//
//  ASDisplayNode+Theme.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import AsyncDisplayKit
extension ASDisplayNode: Theme {}
extension ThemeBase where T: ASDisplayNode {
    func backgroundColor(theme:@escaping (Bool)->UIColor){
        fire(#selector(setter: ASDisplayNode.backgroundColor), theme)
    }
}

extension ThemeBase where T: ASTextNode {
    func attributeText(theme:@escaping (Bool)->NSAttributedString){
        fire(#selector(setter: ASTextNode.attributedText), theme)
    }
}

extension ThemeBase where T: ASImageNode {
    func image(theme:@escaping (Bool)->UIImage){
        fire(#selector(setter: ASImageNode.image), theme)
    }
}
