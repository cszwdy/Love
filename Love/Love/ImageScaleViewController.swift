//
//  DetailSingleViewController.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class ImageScaleViewController: ASViewController<ASDisplayNode> {
    
    var imgURL: URL!
    var imgSize: CGSize!
    var defaultImg: UIImage?
    fileprivate let imgNode = ASNetworkImageNode()
    fileprivate let scrollNode = ASScrollNode()
    fileprivate var insets = UIEdgeInsets.zero
    fileprivate var fitScale: CGFloat = 1.0
    fileprivate var fillScale: CGFloat = 1.0
    init() {
        super.init(node: ASDisplayNode())
        node.automaticallyManagesSubnodes = true
        scrollNode.addSubnode(imgNode)
        node.layoutSpecBlock = {[weak self] node, size in
            let rootSpec = ASInsetLayoutSpec(insets: .zero, child: self!.scrollNode)
            return rootSpec
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override var prefersStatusBarHidden: Bool {return true}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.black
        scrollNode.view.delegate = self
        scrollNode.view.maximumZoomScale = 3
        imgNode.defaultImage = defaultImg
        imgNode.setURL(imgURL.makePreviewURL(by: .four(667*2, 667*2)), resetToDefault: false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(ImageScaleViewController.tap(sender:)))
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ImageScaleViewController.tapToScale(sender:)))
        doubleTap.numberOfTapsRequired = 2
        node.view.addGestureRecognizer(tap)
        node.view.addGestureRecognizer(doubleTap)
        
        tap.require(toFail: doubleTap)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let size = view.bounds.size
        fillScale = max(size.width/imgSize.width, size.height/imgSize.height)
        fitScale = min(size.width/imgSize.width, size.height/imgSize.height)
        imgNode.view.frame = CGRect(x: 0, y: 0, width: imgSize.width * fitScale, height: imgSize.height * fitScale)
        let s = imgNode.view.frame.size
        
        insets = (s.height / s.width) > size.height/size.width ? UIEdgeInsets(top: 0, left: (size.width - s.width)/2.0, bottom: 0, right: (size.width - s.width)/2.0) : UIEdgeInsets(top: (size.height - s.height) / 2.0, left: 0, bottom: (size.height - s.height) / 2.0, right: 0)
        scrollNode.view.contentInset = insets
        scrollNode.view.contentSize = imgNode.view.bounds.size
    }
    
    func tap(sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
    func tapToScale(sender: UITapGestureRecognizer) {
        scrollNode.view.zoomScale > 1 ? scrollNode.view.setZoomScale(1, animated: true) : scrollNode.view.setZoomScale(3, animated: true)
    }
}

extension ImageScaleViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgNode.view
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        let scale = scrollNode.view.zoomScale
        let nextInset = UIEdgeInsets(top: max(0, (1 + (1 - scale)/2) * insets.top), left: max(0, (1 + (1 - scale)/2) * insets.left), bottom: max(0, (1 + (1 - scale)/2) * insets.bottom), right: max(0, (1 + (1 - scale)/2) * insets.right))
        UIView.animate(withDuration: 0.2) {
            self.scrollNode.view.contentInset = nextInset
        }
    }
}
