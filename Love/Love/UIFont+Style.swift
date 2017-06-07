//
//  UIFont+Style.swift
//  asb
//
//  Created by Emiaostein on 04/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

// MARK: - Font Style

extension UIFont {
    class var style: StyleBase<UIFont> {return StyleBase(base: UIFont.systemFont(ofSize: 17))}
}

extension StyleBase where T == UIFont {
    enum TextStyle {
        case title1, title2, title3, headline, body, callout, subhead, footnote, caption1, caption2
    }
    
    enum TextSize {
        case xSmall
        case small
        case medium
        case large // default
        case xLarge
        case xxLarge
        case xxxLarge
    }
    
    func font(_ style: TextStyle, _ size: TextSize = .large) -> UIFont {
        switch (style, size) {
        case (.title1, .xSmall):
            return UIFont.systemFont(ofSize: 25, weight: UIFontWeightLight)
        case (.title2, .xSmall):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightRegular)
        case (.title3, .xSmall):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        case (.headline, .xSmall):
            return UIFont.systemFont(ofSize: 14, weight: UIFontWeightSemibold)
        case (.body, .xSmall):
            return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
        case (.callout, .xSmall):
            return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
        case (.subhead, .xSmall):
            return UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        case (.footnote, .xSmall):
            return UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        case (.caption1, .xSmall):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
        case (.caption2, .xSmall):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
            
        case (.title1, .small):
            return UIFont.systemFont(ofSize: 26, weight: UIFontWeightLight)
        case (.title2, .small):
            return UIFont.systemFont(ofSize: 20, weight: UIFontWeightRegular)
        case (.title3, .small):
            return UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
        case (.headline, .small):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightSemibold)
        case (.body, .small):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        case (.callout, .small):
            return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
        case (.subhead, .small):
            return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
        case (.footnote, .small):
            return UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        case (.caption1, .small):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
        case (.caption2, .small):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
            
        case (.title1, .medium):
            return UIFont.systemFont(ofSize: 27, weight: UIFontWeightLight)
        case (.title2, .medium):
            return UIFont.systemFont(ofSize: 21, weight: UIFontWeightRegular)
        case (.title3, .medium):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightRegular)
        case (.headline, .medium):
            return UIFont.systemFont(ofSize: 16, weight: UIFontWeightSemibold)
        case (.body, .medium):
            return UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
        case (.callout, .medium):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        case (.subhead, .medium):
            return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
        case (.footnote, .medium):
            return UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        case (.caption1, .medium):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
        case (.caption2, .medium):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
            
        case (.title1, .large):
            return UIFont.systemFont(ofSize: 28, weight: UIFontWeightLight)
        case (.title2, .large):
            return UIFont.systemFont(ofSize: 22, weight: UIFontWeightRegular)
        case (.title3, .large):
            return UIFont.systemFont(ofSize: 20, weight: UIFontWeightRegular)
        case (.headline, .large):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightSemibold)
        case (.body, .large):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        case (.callout, .large):
            return UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
        case (.subhead, .large):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        case (.footnote, .large):
            return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
        case (.caption1, .large):
            return UIFont.systemFont(ofSize: 12, weight: UIFontWeightRegular)
        case (.caption2, .large):
            return UIFont.systemFont(ofSize: 11, weight: UIFontWeightRegular)
            
        case (.title1, .xLarge):
            return UIFont.systemFont(ofSize: 30, weight: UIFontWeightLight)
        case (.title2, .xLarge):
            return UIFont.systemFont(ofSize: 24, weight: UIFontWeightRegular)
        case (.title3, .xLarge):
            return UIFont.systemFont(ofSize: 22, weight: UIFontWeightRegular)
        case (.headline, .xLarge):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightSemibold)
        case (.body, .xLarge):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightRegular)
        case (.callout, .xLarge):
            return UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
        case (.subhead, .xLarge):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        case (.footnote, .xLarge):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
        case (.caption1, .xLarge):
            return UIFont.systemFont(ofSize: 14, weight: UIFontWeightRegular)
        case (.caption2, .xLarge):
            return UIFont.systemFont(ofSize: 13, weight: UIFontWeightRegular)
            
        case (.title1, .xxLarge):
            return UIFont.systemFont(ofSize: 32, weight: UIFontWeightLight)
        case (.title2, .xxLarge):
            return UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)
        case (.title3, .xxLarge):
            return UIFont.systemFont(ofSize: 24, weight: UIFontWeightRegular)
        case (.headline, .xxLarge):
            return UIFont.systemFont(ofSize: 21, weight: UIFontWeightSemibold)
        case (.body, .xxLarge):
            return UIFont.systemFont(ofSize: 21, weight: UIFontWeightRegular)
        case (.callout, .xxLarge):
            return UIFont.systemFont(ofSize: 20, weight: UIFontWeightRegular)
        case (.subhead, .xxLarge):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightRegular)
        case (.footnote, .xxLarge):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        case (.caption1, .xxLarge):
            return UIFont.systemFont(ofSize: 16, weight: UIFontWeightRegular)
        case (.caption2, .xxLarge):
            return UIFont.systemFont(ofSize: 15, weight: UIFontWeightRegular)
            
        case (.title1, .xxxLarge):
            return UIFont.systemFont(ofSize: 34, weight: UIFontWeightLight)
        case (.title2, .xxxLarge):
            return UIFont.systemFont(ofSize: 28, weight: UIFontWeightRegular)
        case (.title3, .xxxLarge):
            return UIFont.systemFont(ofSize: 26, weight: UIFontWeightRegular)
        case (.headline, .xxxLarge):
            return UIFont.systemFont(ofSize: 23, weight: UIFontWeightSemibold)
        case (.body, .xxxLarge):
            return UIFont.systemFont(ofSize: 23, weight: UIFontWeightRegular)
        case (.callout, .xxxLarge):
            return UIFont.systemFont(ofSize: 22, weight: UIFontWeightRegular)
        case (.subhead, .xxxLarge):
            return UIFont.systemFont(ofSize: 21, weight: UIFontWeightRegular)
        case (.footnote, .xxxLarge):
            return UIFont.systemFont(ofSize: 19, weight: UIFontWeightRegular)
        case (.caption1, .xxxLarge):
            return UIFont.systemFont(ofSize: 18, weight: UIFontWeightRegular)
        case (.caption2, .xxxLarge):
            return UIFont.systemFont(ofSize: 17, weight: UIFontWeightRegular)
        }
    }
    
    func make(_ style: TextStyle, _ size: TextSize, _ width: CGFloat) -> UIFont {
        switch (style, size) {
        case (.title1, .xSmall):
            return UIFont.systemFont(ofSize: 25, weight: width)
        case (.title2, .xSmall):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.title3, .xSmall):
            return UIFont.systemFont(ofSize: 17, weight: width)
        case (.headline, .xSmall):
            return UIFont.systemFont(ofSize: 14, weight: width)
        case (.body, .xSmall):
            return UIFont.systemFont(ofSize: 14, weight: width)
        case (.callout, .xSmall):
            return UIFont.systemFont(ofSize: 13, weight: width)
        case (.subhead, .xSmall):
            return UIFont.systemFont(ofSize: 12, weight: width)
        case (.footnote, .xSmall):
            return UIFont.systemFont(ofSize: 12, weight: width)
        case (.caption1, .xSmall):
            return UIFont.systemFont(ofSize: 11, weight: width)
        case (.caption2, .xSmall):
            return UIFont.systemFont(ofSize: 11, weight: width)
            
        case (.title1, .small):
            return UIFont.systemFont(ofSize: 26, weight: width)
        case (.title2, .small):
            return UIFont.systemFont(ofSize: 20, weight: width)
        case (.title3, .small):
            return UIFont.systemFont(ofSize: 18, weight: width)
        case (.headline, .small):
            return UIFont.systemFont(ofSize: 15, weight: width)
        case (.body, .small):
            return UIFont.systemFont(ofSize: 15, weight: width)
        case (.callout, .small):
            return UIFont.systemFont(ofSize: 14, weight: width)
        case (.subhead, .small):
            return UIFont.systemFont(ofSize: 13, weight: width)
        case (.footnote, .small):
            return UIFont.systemFont(ofSize: 12, weight: width)
        case (.caption1, .small):
            return UIFont.systemFont(ofSize: 11, weight: width)
        case (.caption2, .small):
            return UIFont.systemFont(ofSize: 11, weight: width)
            
        case (.title1, .medium):
            return UIFont.systemFont(ofSize: 27, weight: width)
        case (.title2, .medium):
            return UIFont.systemFont(ofSize: 21, weight: width)
        case (.title3, .medium):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.headline, .medium):
            return UIFont.systemFont(ofSize: 16, weight: width)
        case (.body, .medium):
            return UIFont.systemFont(ofSize: 16, weight: width)
        case (.callout, .medium):
            return UIFont.systemFont(ofSize: 15, weight: width)
        case (.subhead, .medium):
            return UIFont.systemFont(ofSize: 14, weight: width)
        case (.footnote, .medium):
            return UIFont.systemFont(ofSize: 12, weight: width)
        case (.caption1, .medium):
            return UIFont.systemFont(ofSize: 11, weight: width)
        case (.caption2, .medium):
            return UIFont.systemFont(ofSize: 11, weight: width)
            
        case (.title1, .large):
            return UIFont.systemFont(ofSize: 28, weight: width)
        case (.title2, .large):
            return UIFont.systemFont(ofSize: 22, weight: width)
        case (.title3, .large):
            return UIFont.systemFont(ofSize: 20, weight: width)
        case (.headline, .large):
            return UIFont.systemFont(ofSize: 17, weight: width)
        case (.body, .large):
            return UIFont.systemFont(ofSize: 17, weight: width)
        case (.callout, .large):
            return UIFont.systemFont(ofSize: 16, weight: width)
        case (.subhead, .large):
            return UIFont.systemFont(ofSize: 15, weight: width)
        case (.footnote, .large):
            return UIFont.systemFont(ofSize: 13, weight: width)
        case (.caption1, .large):
            return UIFont.systemFont(ofSize: 12, weight: width)
        case (.caption2, .large):
            return UIFont.systemFont(ofSize: 11, weight: width)
            
        case (.title1, .xLarge):
            return UIFont.systemFont(ofSize: 30, weight: width)
        case (.title2, .xLarge):
            return UIFont.systemFont(ofSize: 24, weight: width)
        case (.title3, .xLarge):
            return UIFont.systemFont(ofSize: 22, weight: width)
        case (.headline, .xLarge):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.body, .xLarge):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.callout, .xLarge):
            return UIFont.systemFont(ofSize: 18, weight: width)
        case (.subhead, .xLarge):
            return UIFont.systemFont(ofSize: 17, weight: width)
        case (.footnote, .xLarge):
            return UIFont.systemFont(ofSize: 15, weight: width)
        case (.caption1, .xLarge):
            return UIFont.systemFont(ofSize: 14, weight: width)
        case (.caption2, .xLarge):
            return UIFont.systemFont(ofSize: 13, weight: width)
            
        case (.title1, .xxLarge):
            return UIFont.systemFont(ofSize: 32, weight: width)
        case (.title2, .xxLarge):
            return UIFont.systemFont(ofSize: 26, weight: width)
        case (.title3, .xxLarge):
            return UIFont.systemFont(ofSize: 24, weight: width)
        case (.headline, .xxLarge):
            return UIFont.systemFont(ofSize: 21, weight: width)
        case (.body, .xxLarge):
            return UIFont.systemFont(ofSize: 21, weight: width)
        case (.callout, .xxLarge):
            return UIFont.systemFont(ofSize: 20, weight: width)
        case (.subhead, .xxLarge):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.footnote, .xxLarge):
            return UIFont.systemFont(ofSize: 17, weight: width)
        case (.caption1, .xxLarge):
            return UIFont.systemFont(ofSize: 16, weight: width)
        case (.caption2, .xxLarge):
            return UIFont.systemFont(ofSize: 15, weight: width)
            
        case (.title1, .xxxLarge):
            return UIFont.systemFont(ofSize: 34, weight: width)
        case (.title2, .xxxLarge):
            return UIFont.systemFont(ofSize: 28, weight: width)
        case (.title3, .xxxLarge):
            return UIFont.systemFont(ofSize: 26, weight: width)
        case (.headline, .xxxLarge):
            return UIFont.systemFont(ofSize: 23, weight: width)
        case (.body, .xxxLarge):
            return UIFont.systemFont(ofSize: 23, weight: width)
        case (.callout, .xxxLarge):
            return UIFont.systemFont(ofSize: 22, weight: width)
        case (.subhead, .xxxLarge):
            return UIFont.systemFont(ofSize: 21, weight: width)
        case (.footnote, .xxxLarge):
            return UIFont.systemFont(ofSize: 19, weight: width)
        case (.caption1, .xxxLarge):
            return UIFont.systemFont(ofSize: 18, weight: width)
        case (.caption2, .xxxLarge):
            return UIFont.systemFont(ofSize: 17, weight: width)
        }
    }
}
