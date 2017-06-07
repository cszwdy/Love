////
////  LoginViewController.swift
////  Love
////
////  Created by Emiaostein on 30/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class LoginViewController: ASViewController<ASPagerNode> {
//    
//    weak var loginNode: LoginNode?
//    
//    init() {
//        super.init(node: ASPagerNode())
//        node.allowsAutomaticInsetsAdjustment = true
//        node.setDataSource(self)
//        node.setDelegate(self)
//        
//    }
//    
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//        
//        node.view.isScrollEnabled = false
//    }
//    
//    override func viewDidAppear(_ animated: Bool) {
//    }
//    
//    func toSplash() {
//        DispatchQueue.main.async {[weak self] in
//            self?.node.scrollToPage(at: 0, animated: true)
//        }
//        
//    }
//    
//    func toLogin() {
//        
////        DispatchQueue.main.async {[weak self] in
//            node.scrollToPage(at: 1, animated: true)
////        }
//        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3) { [weak self] in
//            self?.loginNode?.becom()
//        }
//    }
//}
//
//extension LoginViewController: ASPagerDataSource, ASPagerDelegate {
//    func numberOfPages(in pagerNode: ASPagerNode) -> Int {
//        return 2
//    }
//    
//    func pagerNode(_ pagerNode: ASPagerNode, nodeBlockAt index: Int) -> ASCellNodeBlock {
//        
//        return {[weak self] _ in
//            let cell = ASCellNode()
//            cell.automaticallyManagesSubnodes = true
//            switch index {
//            case 0:
//                let splash = SplashNode()
//                splash.clickBlock = {self?.toLogin()}
//                cell.layoutSpecBlock = {node, size in return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: splash)}
//            case 1:
//                
//                let login = LoginNode()
//                self?.loginNode = login
//                login.began(phoneUpdate: { (phone, context) in
//                    if phone.lengthOfBytes(using: .utf8) == 11 { context.phoneSuccess(true) }
//                }, codeUpdate: { (code, context) in
//                    if code.lengthOfBytes(using: .utf8) == 4 { context.codeSuccess(true) }
//                }, back: {
//                    self?.toSplash()
//                }, dismiss: {
//                })
//                
//                cell.layoutSpecBlock = {_, _ in return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: login)}
//                
//            default:
//                ()
//            }
//            
//            return cell
//        }
//    }
//}
//
//extension LoginViewController {
//    
//    func collectionNode(_ collectionNode: ASCollectionNode, willDisplayItemWith node: ASCellNode) {
//        
////        if node.subnodes.count > 0, let loginNode = node.subnodes[0] as? LoginNode {
////            loginNode.becom()
////            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 0.3, execute: {[weak loginNode] in
////                loginNode?.becom()
////            })
////        }
//    }
//}
