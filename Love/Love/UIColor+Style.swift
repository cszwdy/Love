//
//  UIColor+Style.swift
//  asb
//
//  Created by Emiaostein on 04/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

// MARK: - UIColor Style
extension UIColor {
    
    class var style: StyleBase<UIColor> {return StyleBase(base: UIColor.white)}
}

extension StyleBase where T == UIColor {
    
    var allColors: [UIColor] {return [red, orange, yellow, green, tealBlue, blue, purple, pink, black, gray, midGray, lightGray2, lightGray, customGray, white]}
    
    var red: UIColor {return UIColor(red:255/255, green:59/255, blue:48/255, alpha:1)}
    var orange: UIColor {return UIColor(red: 255/255, green: 149/255, blue: 0, alpha: 1)}
    var yellow: UIColor {return UIColor(red: 255/255, green: 204/255, blue: 0/255, alpha: 1)}
    var green: UIColor {return UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1)}
    var tealBlue: UIColor {return UIColor(red: 90/255, green: 200/255, blue: 250/255, alpha: 1)}
    var blue: UIColor {return UIColor(red: 0/255, green: 122/255, blue: 255/255, alpha: 1)}
    var purple: UIColor {return UIColor(red: 88/255, green: 86/255, blue: 214/255, alpha: 1)}
    var pink: UIColor {return UIColor(red: 255/255, green: 45/255, blue: 85/255, alpha: 1)}
    var black: UIColor {return UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)}
    var gray: UIColor {return UIColor(red: 142/255, green: 142/255, blue: 147/255, alpha: 1)}
    var midGray: UIColor {return UIColor(red: 199/255, green: 199/255, blue: 204/255, alpha: 1)}
    var lightGray2: UIColor {return UIColor(red: 209/255, green: 209/255, blue: 214/255, alpha: 1)}
    var lightGray: UIColor {return UIColor(red: 229/255, green: 229/255, blue: 234/255, alpha: 1)}
    var customGray: UIColor {return UIColor(red: 239/255, green: 239/255, blue: 244/255, alpha: 1)}
    var white: UIColor {return UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1)}
}



