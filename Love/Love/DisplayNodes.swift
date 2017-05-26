////
////  DisplayNodes.swift
////  Love
////
////  Created by Emiaostein on 04/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import Foundation
//import AsyncDisplayKit
//
//class DisplayNode: ASDisplayNode {
//    override init() {
//        super.init()
//        automaticallyManagesSubnodes = true
//    }
//    
//    func change(completed: (()->())?) {}
//}
//
//
//
//extension NSAttributedString {
//    struct Style {
//    }
//    
//    class var style: Style {return Style()}
//}
//
//extension NSAttributedString.Style {
//    func content(_ str: String) -> NSAttributedString {
//        let font = UIFont.systemFont(ofSize: 9)
//        let textParaStyle1 = NSMutableParagraphStyle()
//        textParaStyle1.alignment = NSTextAlignment.right
//        return NSAttributedString(string: str, attributes: [NSFontAttributeName: font, NSParagraphStyleAttributeName : textParaStyle1])
//    }
//    
//    func content2(_ str: String) -> NSAttributedString {
//        let font = UIFont.systemFont(ofSize: 9)
//        let textParaStyle1 = NSMutableParagraphStyle()
//        textParaStyle1.alignment = NSTextAlignment.left
//        return NSAttributedString(string: str, attributes: [NSFontAttributeName: font, NSParagraphStyleAttributeName : textParaStyle1])
//    }
//}
//
//final class aniNode: DisplayNode {
//    private let title = ASTextNode()
//    private let icon = ASImageNode()
//    private var state = false
//    override init() {
//        super.init()
//        title.attributedText = NSAttributedString.style.content("Emiaostein")
//        icon.image = UIImage(named: "more")
//    }
//    
//    override func change(completed: (() -> ())?) {
//        state = !state
//        transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: completed)
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let childen = state == true ? [icon, title] : [title]
//        let stack = ASStackLayoutSpec.vertical()
//        stack.spacing = 40
//        stack.children = childen
//        return stack
//    }
//}
//
//
//final class InfoNode: DisplayNode {
//    //Nodes
//    private let header = ASTextNode()
//    private let locationTitle = ASTextNode()
//    private let locationIcon = ASImageNode()
//    private let locationContent = ASTextNode()
//    private let callTitle = ASTextNode()
//    private let callIcon = ASImageNode()
//    private let callContent = ASTextNode()
//    private let moreTitle = ASTextNode()
//    private let moreIcon = ASImageNode()
//    private let moreContent = ASTextNode()
//    private let timeTitle = ASTextNode()
//    private let timeIcon = ASImageNode()
//    // layout states
//    private var state = false
//    
//    
//    init(location: String, callNumber: String, more: String) {
//        super.init()
//        header.attributedText = NSAttributedString(string: "Traveo HQ")
//        locationTitle.attributedText = NSAttributedString(string: "Directions")
//        callTitle.attributedText = NSAttributedString(string: "Call")
//        moreTitle.attributedText = NSAttributedString(string: "More Info")
//        timeTitle.attributedText = NSAttributedString(string: "Hours")
//        
//        locationContent.attributedText = NSAttributedString.style.content(location)
//        callContent.attributedText = NSAttributedString.style.content(callNumber)
//        moreContent.attributedText = NSAttributedString.style.content(more)
//        
//        
//        locationIcon.image = UIImage(named: "location")
//        callIcon.image = UIImage(named: "call")
//        moreIcon.image = UIImage(named: "more")
//        timeIcon.image = UIImage(named: "time")
//    }
//    
//    override func change(completed: (()->())?) {
//        
//        locationContent.attributedText = NSAttributedString.style.content2(locationContent.attributedText!.string)
//        callContent.attributedText = NSAttributedString.style.content2(callContent.attributedText!.string)
//        moreContent.attributedText = NSAttributedString.style.content2(moreContent.attributedText!.string)
//        
//        state = !state
//        transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: completed)
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        if state == true {
//        let location = [locationIcon, locationTitle, locationContent]
//        let call = [callIcon, callTitle, callContent]
//        let more = [moreIcon, moreTitle, moreContent]
//        let times = [timeIcon, timeTitle]
//        
//        let infoStack = ASStackLayoutSpec.vertical()
//        infoStack.spacing = 20
//        infoStack.children = []
//        for (n, i) in [location, call, more, times].enumerated() {
//            let iconAndtitleStack = ASStackLayoutSpec(direction: .horizontal, spacing: 0, justifyContent: .start, alignItems: .center, children: [i[0], i[1]])
//            iconAndtitleStack.style.flexBasis = ASDimensionMakeWithFraction(0.4)
//            if i.count > 2 {
//                let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20), child: i[2])
//                insetSpec.style.flexBasis = ASDimensionMakeWithFraction(0.6)
//                insetSpec.style.flexShrink = 1.0
//                let contentStack = ASStackLayoutSpec.horizontal()
//                contentStack.verticalAlignment = n == 0 ? .top : .center
//                contentStack.children = [iconAndtitleStack, insetSpec]
//                infoStack.children!.append(contentStack)
//            } else {
//                infoStack.children!.append(iconAndtitleStack)
//            }
//        }
//        
//        let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 20), child: infoStack)
//        
//        return insetSpec
//        } else {
//            let nodes = [locationTitle, locationContent, callTitle, callContent,moreTitle, moreContent]
//            let stack = ASStackLayoutSpec.vertical()
//            stack.spacing = 20
//            stack.children = nodes
//            stack.style.flexShrink = 1.0
//            return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 40, bottom: 0, right: 40), child: stack)
//        }
//    }
//}
//
//extension UIImage {
//    
//    func makeCircularImage(size: CGSize, borderWidth width: CGFloat) -> UIImage {
//        // make a CGRect with the image's size
//        let circleRect = CGRect(origin: .zero, size: size)
//        
//        // begin the image context since we're not in a drawRect:
//        UIGraphicsBeginImageContextWithOptions(circleRect.size, false, 0)
//        
//        // create a UIBezierPath circle
//        let circle = UIBezierPath(roundedRect: circleRect, cornerRadius: circleRect.size.width * 0.2)
//        
//        // clip to the circle
//        circle.addClip()
//        
//        UIColor.white.set()
//        circle.fill()
//        
//        // draw the image in the circleRect *AFTER* the context is clipped
//        self.draw(in: circleRect)
//        
//        // create a border (for white background pictures)
//        if width > 0 {
//            circle.lineWidth = width;
//            UIColor.white.set()
//            circle.stroke()
//        }
//        
//        // get an image from the image context
//        let roundedImage = UIGraphicsGetImageFromCurrentImageContext();
//        
//        // end the image context since we're not in a drawRect:
//        UIGraphicsEndImageContext();
//        
//        return roundedImage ?? self
//    }
//    
//}
