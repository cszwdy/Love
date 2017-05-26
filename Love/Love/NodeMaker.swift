//
//  CellMaker.swift
//  Love
//
//  Created by Emiaostein on 25/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import AsyncDisplayKit

enum PageType {
    case home
}

struct Base<T> {
    let base: T
}

protocol Style {
    associatedtype T = Self
    var style: T {get}
}

extension String: Style {
    var style: String {
        return self
    }
}

extension String {
    var footNote: NSAttributedString {
        return NSAttributedString(string: self,
                                  attributes: [
                                    NSFontAttributeName: UIFont.preferredFont(forTextStyle: .footnote),
                                    NSForegroundColorAttributeName: UIColor.darkText
            ])
    }
}

class NodeMaker {
    
    class func makeCell(by model: DisplayModel) -> ASDisplayNode {

        switch model {
        case let t as Image:
            let imgNode = ImageNode()
            imgNode.cornerImg = #imageLiteral(resourceName: "corner8").stretchableImage(withLeftCapWidth: 8, topCapHeight: 8)
            imgNode.src = (model as! Image).src.makePreviewURL(by: .four(750, -1))
            imgNode.ratio = CGFloat(t.height/t.width)
            imgNode.title = t.title.style.footNote
//            print(t.imageAve)
            if let color = UIColor(hexString: t.imageAve) {
                imgNode.imgBackgroundColor = color
            } else {
                imgNode.imgBackgroundColor = UIColor.groupTableViewBackground
            }
            

            return imgNode
        default:
            return ASDisplayNode()
        }
    }
}



extension NodeMaker {
    class func height(for model: DisplayModel, constraintWidth width: CGFloat, page: PageType) -> CGFloat {
        
        switch model {
        case let m as Image:
            let ratio = m.height/m.width
            let imgH = width * CGFloat(ratio)
            let title = m.title.style.footNote
            let textH = title.boundingRect(with: CGSize(width: width - 8*2, height: 10000), options: NSStringDrawingOptions.usesLineFragmentOrigin, context: nil).size.height
            return imgH + textH + 5
        default:
            return 300
        }
    }
}



final class ImageNode: MediaNode {
    
    private let imgNode = ASNetworkImageNode()
    private let titleNode = ASTextNode()
    private let cornerImgNode = ASImageNode()
    
    var ratio: CGFloat = 1.0 // h/w
    var src: URL? {didSet { imgNode.setURL(src, resetToDefault: true)}}
    var title = NSAttributedString(string: "") { didSet { titleNode.attributedText = title }}
    var cornerImg: UIImage? { didSet {cornerImgNode.image = cornerImg}}
    var imgBackgroundColor = UIColor.white {didSet {imgNode.backgroundColor = imgBackgroundColor}}
    var img: UIImage? {return imgNode.image}
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        //        titleNode.maximumNumberOfLines = 3
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let imgSpec = ASRatioLayoutSpec(ratio: ratio, child: imgNode)
        let cornerSpec = ASOverlayLayoutSpec(child: imgSpec, overlay: ASInsetLayoutSpec(insets: .zero, child: cornerImgNode))
        let titleSpec = ASInsetLayoutSpec(insets: UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8), child: titleNode)
        let rootSpec = ASStackLayoutSpec(direction: .vertical,
                                         spacing: 5,
                                         justifyContent: .start,
                                         alignItems: .start,
                                         children: [cornerSpec, titleSpec])
        return rootSpec
    }
}
