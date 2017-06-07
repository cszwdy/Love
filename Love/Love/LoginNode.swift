////
////  LoginNode.swift
////  Love
////
////  Created by Emiaostein on 30/05/2017.
////  Copyright © 2017 emiaostein. All rights reserved.
////
//
//import UIKit
//import AsyncDisplayKit
//
//class LoginNode: ASDisplayNode, ASEditableTextNodeDelegate {
//    
//    class LoginContext {
//        let phoneSuccess: (Bool)->()
//        let codeSuccess:(Bool)->()
//        
//        init(phoneCheck: @escaping (Bool)->(), codeCheck: @escaping (Bool)->()) {
//            self.phoneSuccess = phoneCheck
//            self.codeSuccess = codeCheck
//        }
//    }
//    
//    private var status = 0 // 0 phone, 1 verify
//    private let title = ASTextNode()
//    private let input = ASEditableTextNode()
//    private let phone = ASTextNode()
//    private let verify = ASTextNode()
//    private let corner = ASImageNode()
//    private let backButton = ASButtonNode()
//    private var context: LoginContext!
//    
//    private var phoneUpdateBlock: ((String, LoginContext) -> ())!
//    private var codeUpdateBlock: ((String, LoginContext) -> ())!
//    private var backBlock:(()->())?
//    private var dismiessBlock:(()->())?
//    
//    override init() {
//        super.init()
//        context = LoginContext(phoneCheck: phone(success:), codeCheck: code(success:))
//        automaticallyManagesSubnodes = true
//        backgroundColor = UIColor.white
//        input.delegate = self
//        input.isHidden = true
//        input.keyboardType = .numberPad
//        
//        phone.backgroundColor = UIColor.style.background
//        phone.textContainerInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
//        phone.cornerRadius = 8
//        
//        verify.backgroundColor = UIColor.style.background
//        verify.textContainerInset = UIEdgeInsets(top: 30, left: 20, bottom: 30, right: 20)
//        verify.cornerRadius = 8
//        
//        title.attributedText = "手机号".style.largeHead
//        corner.image = #imageLiteral(resourceName: "corner8").stretchableImage(withLeftCapWidth: 8, topCapHeight: 8)
//        
//        backButton.addTarget(self, action: #selector(back), forControlEvents: .touchUpInside)
//        backButton.setAttributedTitle("前一步".style.loginBack, for: .normal)
//    }
//    
//    func began(phoneUpdate: @escaping (String, LoginContext) -> (), codeUpdate: @escaping (String, LoginContext) -> (), back:@escaping ()->(), dismiss:@escaping ()->()) {
//        
//        phoneUpdateBlock = phoneUpdate
//        codeUpdateBlock = codeUpdate
//        backBlock = back
//        dismiessBlock = dismiss
//    }
//    
//    func becom() {
//        input.becomeFirstResponder()
//    }
//    
//    func phone(success: Bool) {
//        if success {
//            input.attributedText = nil
//            phone.attributedText = nil
//            title.attributedText = "验证码".style.largeHead
//            status = 1
//            transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: {})
//        } else {
//            phone.attributedText = nil
//        }
//    }
//    
//    func code(success: Bool) {
//        if success {
//            input.attributedText = nil
//            title.attributedText = "成功".style.largeHead
//            dismiessBlock?()
//        } else {
//            input.attributedText = nil
//            verify.attributedText = nil
//        }
//    }
//    
//    func back() {
//        if status == 0 {
//            DispatchQueue.main.async {[weak self] in
//                self?.input.resignFirstResponder()
//            }
//            input.attributedText = nil
//            phone.attributedText = nil
//            backBlock?()
//        } else {
//            title.attributedText = "手机号".style.largeHead
//            input.attributedText = nil
//            phone.attributedText = nil
//            verify.attributedText = nil
//            status = 0
//            transitionLayout(withAnimation: true, shouldMeasureAsync: true, measurementCompletion: {})
//        }
//        
//    }
//    
//    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
//        let displayNode = status == 0 ? phone : verify
//        input.style.preferredSize = CGSize(width: 100, height: 100)
//        displayNode.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 100)
//        backButton.style.preferredSize = CGSize(width: constrainedSize.max.width, height: 44)
//        let rootSpec = ASStackLayoutSpec(direction: .vertical, spacing: 40, justifyContent: .start, alignItems: .start, children: [
//            title,
//            ASOverlayLayoutSpec(child: displayNode, overlay: corner),
//            backButton,
//            input
//            ])
//        
//        
//        return ASInsetLayoutSpec(insets: UIEdgeInsets(top: 64, left: 20, bottom: 0, right: 20), child: rootSpec)
//    }
//    
//    func editableTextNodeDidUpdateText(_ editableTextNode: ASEditableTextNode) {
//        let displayNode = status == 0 ? phone : verify
//        let text = editableTextNode.attributedText?.string ?? ""
//        displayNode.attributedText = text.style.largeHead
//        
//        if !text.isEmpty {
//            status == 0 ? phoneUpdateBlock(text, context) : codeUpdateBlock(text, context)
//        }
//    }
//
//}
