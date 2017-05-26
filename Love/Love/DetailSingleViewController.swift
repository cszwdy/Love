//
//  DetailSingleViewController.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class DetailSingleViewController: ASViewController<ASDisplayNode> {
    
    var imgURL: URL!
    var imgSize: CGSize!
    var holderImg: UIImage?
    let imgNode = ASNetworkImageNode()
    let scrollNode = ASScrollNode()
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
        imgNode.defaultImage = holderImg
        imgNode.setURL(imgURL.makePreviewURL(by: .four(667*2, 667*2)), resetToDefault: false)
        let tap = UITapGestureRecognizer(target: self, action: #selector(DetailSingleViewController.tap(sender:)))
        self.node.view.addGestureRecognizer(tap)

    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let size = view.bounds.size
        let scale = max(size.width/imgSize.width, size.height/imgSize.height)
        imgNode.view.frame = CGRect(x: 0, y: 0, width: imgSize.width * scale, height: imgSize.height * scale)
        let offset = size.width <= imgNode.view.bounds.width ? CGPoint(x: (imgNode.view.bounds.width - size.width) / 2.0, y: 0) : CGPoint(x: 0, y: (imgNode.view.bounds.height - size.height) / 2.0)
        scrollNode.view.contentSize = imgNode.view.bounds.size
        scrollNode.view.contentOffset = offset
    }
    
    func tap(sender: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension DetailSingleViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imgNode.view
    }
}
