//
//  NodeTestViewController.swift
//  Love
//
//  Created by Emiaostein on 07/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import UIKit
import AsyncDisplayKit

class NodeTestViewController: ASViewController<ImageScalePageNode> {
    
    init() {
        super.init(node: ImageScalePageNode())
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
