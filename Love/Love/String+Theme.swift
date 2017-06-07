//
//  String+Style.swift
//  asb
//
//  Created by Emiaostein on 04/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

extension String: Theme {}
extension ThemeBase where T==String {
    var LargeTitle: NSAttributedString {
        return NSAttributedString(string: base,
                                  attributes: [NSFontAttributeName: UIFont.style.make(.title1, .xxxLarge, UIFontWeightSemibold),
                                               NSForegroundColorAttributeName: UIColor.theme.forward
            ])
    }
    
    var largeCaption2: NSAttributedString {
        return NSAttributedString(string: base,
                                  attributes: [NSFontAttributeName: UIFont.style.font(.caption2, .xxxLarge),
                                               NSForegroundColorAttributeName: UIColor.theme.minorForward
            ])
    }
    
    var headline: NSAttributedString {
        return NSAttributedString(string: base,
                                  attributes: [NSFontAttributeName: UIFont.style.font(.headline),
                                               NSForegroundColorAttributeName: UIColor.theme.forward
            ])
    }
    
    var caption2: NSAttributedString {
        return NSAttributedString(string: base,
                                  attributes: [NSFontAttributeName: UIFont.style.font(.caption2),
                                               NSForegroundColorAttributeName: UIColor.theme.minorForward
            ])
    }
}
