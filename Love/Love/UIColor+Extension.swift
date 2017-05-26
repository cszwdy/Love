//
//  UIColor + Extension.swift
//  Love
//
//  Created by Emiaostein on 26/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    public convenience init?(hexString: String) {
        let r, g, b, a: CGFloat
        
        if hexString.hasPrefix("0x") {
            let start = hexString.index(hexString.startIndex, offsetBy: 2)
            let hexColor = hexString.substring(from: start)
            
            if hexColor.characters.count == 6 {
                let scanner = Scanner(string: hexColor)
                var hexNumber: UInt64 = 0
                
                if scanner.scanHexInt64(&hexNumber) {
                    let divisor = CGFloat(255)
                    let red     = CGFloat((hexNumber & 0xFF0000) >> 16) / divisor
                    let green   = CGFloat((hexNumber & 0x00FF00) >>  8) / divisor
                    let blue    = CGFloat( hexNumber & 0x0000FF       ) / divisor
                    self.init(red: red, green: green, blue: blue, alpha: 1)
                    return
                }
            }
        }
        
        return nil
    }
}
