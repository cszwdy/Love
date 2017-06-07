////
////  SplashNode.swift
////  Love
////
////  Created by Emiaostein on 30/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class SplashNode: ASDisplayNode {
//    
//    var clickBlock: (()->())?
//    var dismissBlock: (()->())?
//    
//    private let backImage = ASImageNode()
//    private let button = ASButtonNode()
//    private let label = ASTextNode()
//    private let button2 = ASButtonNode()
//    
//    override init() {
//        super.init()
//        backgroundColor = UIColor.white
//        automaticallyManagesSubnodes = true
//        
//        
//        button.addTarget(self, action: #selector(click), forControlEvents: .touchUpInside)
//        button.setAttributedTitle("手机登录".style.splashToLogin, for: .normal)
//        button.backgroundColor = UIColor.style.theme
//        button.cornerRadius = 4
//        
//        label.attributedText = "首次登录获取福利".style.footNote
//        
//        button2.addTarget(self, action: #selector(dismiss), forControlEvents: .touchUpInside)
//        button2.setAttributedTitle("随便看看".style.footNoteSubline, for: .normal)
//        
//        backImage.image = UIImage(named: "Login")
//    }
//    
//    func click() {
//        clickBlock?()
//    }
//    
//    func dismiss() {
//        dismissBlock?()
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        button.style.preferredSize = CGSize(width: 200, height: 38)
//        return ASOverlayLayoutSpec(child: backImage, overlay: ASInsetLayoutSpec(insets: UIEdgeInsets(top: CGFloat.infinity, left: 20, bottom: 20, right: 20), child: ASStackLayoutSpec(direction: .vertical, spacing: 10, justifyContent: .center, alignItems: .center, children: [button, label, button2])))
//    }
//    
//}
