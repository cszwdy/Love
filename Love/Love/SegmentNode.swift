//
//  SegmentNode.swift
//  Love
//
//  Created by Emiaostein on 05/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class SegmentNode: ASCellNode {
    
    var items: [String] = []
    let segmentControl = UISegmentedControl(items: ["订阅","喜欢"])
    
    override func didLoad() {
        super.didLoad()
        segmentControl.frame = CGRect(x: 0, y: 0, width: 200, height: 44)
        segmentControl.tintColor = UIColor.white
        let count = segmentControl.numberOfSegments
        let segment = segmentControl
        segment.setTitleTextAttributes([NSFontAttributeName: UIFont.systemFont(ofSize: 17)], for: .normal)
        segment.setTitleTextAttributes([NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17)], for: .selected)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .selected, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
        segment.setDividerImage(UIImage(), forLeftSegmentState: .selected, rightSegmentState: .selected, barMetrics: .default)
        segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.backward, count: count, size: CGSize(width: 200, height: 44)), for: .normal, barMetrics: .default)
        segment.setBackgroundImage(UIImage.cornerRectangle(color: UIColor.theme.minorBackwrad, count: count, size: CGSize(width: 200, height: 44)), for: .selected, barMetrics: .default)
        
//        App.theme.add {[weak segmentControl] (light) in
//            guard let segment = segmentControl else {return}
//            
//        }
        view.addSubview(segment)
    }
}

extension UIImage {
    
    class func cornerRectangle(color: UIColor, count: Int, size: CGSize) -> UIImage {
        let w = size.width/CGFloat(count)
        let h = size.height
        let radius = h/2
        var paths = [UIBezierPath]()
        for i in 0..<count {
            let path = UIBezierPath(roundedRect: CGRect(x: w*CGFloat(i), y: 0, width: w, height: h), cornerRadius: radius)
            paths.append(path)
        }
        UIGraphicsBeginImageContextWithOptions(size, false, UIScreen.main.scale)
        let context = UIGraphicsGetCurrentContext()
        color.setFill()
        paths.forEach{$0.fill()}
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image!
    }
    
}
