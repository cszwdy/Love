////
////  DemoViewController.swift
////  Love
////
////  Created by Emiaostein on 25/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class DemoViewController: ASViewController<ASDisplayNode> {
//    
//    let demoNode = ImageNode()
//    let groupNode = GroupNode()
//    
//    init() {
//        super.init(node: ASDisplayNode())
//        setupGrouNode()
////        setupImgNode()
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        node.backgroundColor = UIColor.white
//        
////        beganImgNode()
//        beganGroupNode()
//    }
//    
//    func setupGrouNode() {
//        groupNode.automaticallyManagesSubnodes = true
//        node.automaticallyManagesSubnodes = true
//        node.layoutSpecBlock = {[weak self] node, size in
//            let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50), child: self!.groupNode)
//            let rootSpec = ASCenterLayoutSpec(centeringOptions: ASCenterLayoutSpecCenteringOptions.XY, sizingOptions: ASCenterLayoutSpecSizingOptions.minimumXY, child: insetSpec)
//            return rootSpec
//        }
//        
//    }
//    
//    func beganGroupNode() {
//        groupNode.urls = [
//            URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-01-lrg.jpg")!.makePreviewURL(by: .four(200, -1)),
//            URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-02-lrg.jpg")!.makePreviewURL(by: .four(200, -1)),
//            URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-03-lrg.jpg")!.makePreviewURL(by: .four(200, -1)),
//            URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-04-lrg.jpg")!.makePreviewURL(by: .four(200, -1))]
//        
//        groupNode.cornerImg =  UIImage(named: "corner8")?.stretchableImage(withLeftCapWidth: 8, topCapHeight: 8)
//        groupNode.title = atitle()
//        groupNode.subtitle = subTitle()
//    }
//    
//    
//    func setupImgNode() {
//        demoNode.automaticallyManagesSubnodes = true
//        node.automaticallyManagesSubnodes = true
//        node.layoutSpecBlock = {[weak self] node, size in
//            let insetSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 100, left: 50, bottom: 100, right: 50), child: self!.demoNode)
//            let rootSpec = ASCenterLayoutSpec(centeringOptions: ASCenterLayoutSpecCenteringOptions.XY, sizingOptions: ASCenterLayoutSpecSizingOptions.minimumXY, child: insetSpec)
//            return rootSpec
//        }
//    }
//    
//    func beganImgNode() {
//        let ratio = 4000.0/2668.0
//        let cornerImg = UIImage(named: "corner8")
//        //        cornerImg?.stretchableImage(withLeftCapWidth: 4, topCapHeight: 4)
//        demoNode.ratio = CGFloat(ratio)
//        demoNode.src = URL(string: "http://oq8t6idvw.bkt.clouddn.com/x-art-885-01-lrg.jpg")!.makePreviewURL(by: .four(750, -1))
//        demoNode.title = subTitle()
//        demoNode.cornerImg =  cornerImg?.stretchableImage(withLeftCapWidth: 8, topCapHeight: 8)
//    }
//}
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//func atitle() -> NSAttributedString
//{
//    // Create the attributed string
//    let title = NSMutableAttributedString(string:"Angelica")
//    
//    // Declare the fonts
//    let titleFont1 = UIFont(name:"AvenirNext-Regular", size:17.0)
//    
//    // Declare the colors
//    let titleColor1 = UIColor(red: 0.292745, green: 0.461693, blue: 0.998524, alpha: 1.000000)
//    
//    // Declare the paragraph styles
//    let titleParaStyle1 = NSMutableParagraphStyle()
//    titleParaStyle1.tabStops = [NSTextTab(textAlignment: NSTextAlignment.left, location: 28.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 56.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 84.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 112.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 140.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 168.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 196.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 224.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 252.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 280.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 308.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 336.000000, options: [:]), ]
//    
//    
//    // Create the attributes and add them to the string
//    title.addAttribute(NSParagraphStyleAttributeName, value:titleParaStyle1, range:NSMakeRange(0,8))
//    title.addAttribute(NSFontAttributeName, value:titleFont1!, range:NSMakeRange(0,8))
//    title.addAttribute(NSUnderlineColorAttributeName, value:titleColor1, range:NSMakeRange(0,8))
//    title.addAttribute(NSUnderlineStyleAttributeName, value:1, range:NSMakeRange(0,8))
//    
//    return NSAttributedString(attributedString:title)
//}
//
//func subTitle() -> NSAttributedString
//{
//    // Create the attributed string
//    let subTitle = NSMutableAttributedString(string:"Angelica is a genus of about 60 species of tall biennial and perennial herbs in the family Apiaceae, native to temperate and subarctic regions of the Northern Hemisphere, reaching as far north as Iceland and Lapland and Greenland.")
//    
//    // Declare the fonts
//    let subTitleFont1 = UIFont(name:"AvenirNext-Regular", size:12.0)
//    
//    // Declare the colors
//    let subTitleColor1 = UIColor(red: 0.292745, green: 0.461693, blue: 0.998524, alpha: 1.000000)
//    let subTitleColor2 = UIColor(red: 0.501961, green: 0.501961, blue: 0.501961, alpha: 1.000000)
//    
//    // Declare the paragraph styles
//    let subTitleParaStyle1 = NSMutableParagraphStyle()
//    subTitleParaStyle1.tabStops = [NSTextTab(textAlignment: NSTextAlignment.left, location: 28.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 56.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 84.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 112.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 140.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 168.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 196.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 224.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 252.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 280.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 308.000000, options: [:]), NSTextTab(textAlignment: NSTextAlignment.left, location: 336.000000, options: [:]), ]
//    
//    
//    // Create the attributes and add them to the string
//    subTitle.addAttribute(NSFontAttributeName, value:subTitleFont1!, range:NSMakeRange(0,230))
//    subTitle.addAttribute(NSParagraphStyleAttributeName, value:subTitleParaStyle1, range:NSMakeRange(0,230))
//    subTitle.addAttribute(NSUnderlineColorAttributeName, value:subTitleColor1, range:NSMakeRange(0,230))
//    subTitle.addAttribute(NSForegroundColorAttributeName, value:subTitleColor2, range:NSMakeRange(0,230))
//    
//    return NSAttributedString(attributedString:subTitle)
//}

