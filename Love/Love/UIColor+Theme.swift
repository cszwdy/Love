//
//  UIColor+Style.swift
//  asb
//
//  Created by Emiaostein on 04/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
    class var theme: ThemeBase<UIColor> {return ThemeBase(base: UIColor.white)}
}

extension ThemeBase where T == UIColor {
    
    enum ColorStyle {
        case tint, forward, backward, minorForward, minorBackwrad
    }
    
    var allStyles: [ColorStyle] { return [
        .tint,
        .forward,
        .backward,
        .minorForward,
        .minorBackwrad
        ]}
    
    var allThemes: [UIColor] {return [
        tint,
        forward,
        backward,
        minorForward,
        minorBackwrad
        ]}
    
    var tint: UIColor {return make(.tint)}
    var forward: UIColor {return make(.forward)}
    var backward: UIColor {return make(.backward)}
    var minorForward: UIColor {return make(.minorForward)}
    var minorBackwrad: UIColor {return make(.minorBackwrad)}
    
    func make(_ style: ColorStyle) -> UIColor {
        return make(style, App.theme.light)
    }
    
    private var customBlack: UIColor {return UIColor(red: 30/255, green: 30/255, blue: 30/255, alpha: 1)} // custom
    private func make(_ style: ColorStyle, _ light: Bool) -> UIColor {
        switch style {
        case .tint: return light ? UIColor.style.red : UIColor.style.orange
        case .forward: return light ? UIColor.style.black : UIColor.style.white
        case .backward: return light ? UIColor.style.white : UIColor.style.black
        case .minorForward: return light ? UIColor.style.gray : UIColor.style.gray
        case .minorBackwrad: return light ? UIColor.style.customGray : customBlack
        }
    }
  
    
}
