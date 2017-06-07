////
////  ImageCellNode.swift
////  Love
////
////  Created by Emiaostein on 25/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//
//// ImageNode in NodeMaker.swift
//import AsyncDisplayKit
//
//final class ImageNode: MediaNode {
//    
//    private let imgNode = ASNetworkImageNode()
//    private let titleNode = ASTextNode()
//    private let cornerImgNode = ASImageNode()
//    
//    var ratio: CGFloat = 1.0 // h/w
//    var src: URL? {didSet { imgNode.setURL(src, resetToDefault: true)}}
//    var title = NSAttributedString(string: "") { didSet { titleNode.attributedText = title }}
//    var cornerImg: UIImage? { didSet {cornerImgNode.image = cornerImg}}
//    var imgBackgroundColor = UIColor.white {didSet {imgNode.backgroundColor = imgBackgroundColor}}
//    var img: UIImage? {return imgNode.image}
//    
//    override init() {
//        super.init()
//        automaticallyManagesSubnodes = true
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let img = ASRatioLayoutSpec(ratio: ratio, child: imgNode)
//        let cornerSpec = ASOverlayLayoutSpec(child: img, overlay: ASInsetLayoutSpec(insets: .zero, child: cornerImgNode))
//        let titleSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: titleNode)
//        let rootSpec = ASStackLayoutSpec(direction: .vertical,
//                                         spacing: 5,
//                                         justifyContent: .start,
//                                         alignItems: .start,
//                                         children: [cornerSpec, titleSpec])
//        return rootSpec
//    }
//}
