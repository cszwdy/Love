//
//  ImageScaleNode.swift
//  Love
//
//  Created by Emiaostein on 07/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ImageScaleNode: ASDisplayNode {
    
    var size = CGSize(width: 1409, height: 800)
    let imgNode = ASNetworkImageNode()
    let scrollNode = ASScrollNode()
    
    override init() {
        super.init()
        automaticallyManagesSubnodes = true
        scrollNode.addSubnode(imgNode)
        backgroundColor = UIColor.white
    }
    
    override func layoutSpecThatFits(
        _ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let edge = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        return ASInsetLayoutSpec(insets: edge,
                                 child: scrollNode)
    }
    
    override func didLoad() {
        super.didLoad()
        scrollNode.view.delegate = self
        imgNode.image = UIImage(named: "a")
        imgNode.frame.size = size
    }
    
    override func layout() {
        super.layout()
        let asize = scrollNode.view.bounds.size
        let w = asize.width
        let h = asize.height
        let amin = min(w/size.width, h/size.height)
        let amax = max(w/size.width, h/size.height)
        scrollNode.view.minimumZoomScale = amin
        scrollNode.view.maximumZoomScale = amax * 2
        scrollNode.view.zoomScale = amin
    }
    
}

extension ImageScaleNode: UIScrollViewDelegate {
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgNode.view
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let w = scrollView.contentSize.width
        let h = scrollView.contentSize.height
        let bw = scrollView.bounds.width
        let bh = scrollView.bounds.height
        imgNode.view.center = CGPoint(x: max(w/2, bw/2),
                                      y: max(h/2, bh/2))
    }
}
