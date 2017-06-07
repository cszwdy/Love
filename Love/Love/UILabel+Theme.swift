//
//  UILabel+Theme.swift
//  asb
//
//  Created by Emiaostein on 03/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit
// MARK: - UIView Theme
extension ThemeBase where T==UILabel {
    func text(_ theme: @escaping (Bool)->NSAttributedString) {
        fire(#selector(setter: UILabel.attributedText), theme)
    }
}
