//
//  UITabbar+Theme.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit
extension ThemeBase where T: UITabBar {
    func tintColor(theme:@escaping (Bool)->UIColor){
        fire(#selector(setter: UITabBar.tintColor), theme)
    }
}
