//
//  UIView+Theme.swift
//  asb
//
//  Created by Emiaostein on 03/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIView Theme
extension UIView: Theme {}
extension ThemeBase where T:UIView {
    func backgroundColor(theme:@escaping (Bool)->UIColor){
        fire(#selector(setter: UIView.backgroundColor), theme)
    }
}
