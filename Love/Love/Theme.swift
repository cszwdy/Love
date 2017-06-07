    //
//  Theme.swift
//  asb
//
//  Created by Emiaostein on 04/06/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation
import UIKit

struct ThemeBase<T> {
    var base: T
}

protocol Theme {
    associatedtype B = ThemeBase<Self>
    var theme: B {get}
}

extension Theme {
    var theme: ThemeBase<Self> {return ThemeBase(base: self)}
}

extension ThemeBase where T: NSObjectProtocol, T:Theme {
    func fire<U>(_ action: Selector, _ themeMaker: @escaping (_ light: Bool)->U) {
        base.perform(action, with: themeMaker(App.theme.light))
        App.theme.add(target: base as? NSObject, action: action, themeMaker: themeMaker)
    }
}

private struct Proxy {
    weak var target: NSObject?
    let action: Selector
    let themeMaker: (_ light: Bool)->Any
}

struct App {
    struct theme {
        static var light = true {didSet {if pre_light != light {pre_light = light; themeDidChanged()}}}
        static var pre_light = true
        static private var proxies: [Proxy] = []
        static private var themeMakers: [(Bool)->()] = []
        fileprivate static func add(target: NSObject?, action: Selector, themeMaker: @escaping (_ light: Bool)->Any) {
            let p = Proxy(target: target, action: action, themeMaker: themeMaker)
            proxies.append(p)
        }
        
        static func add(themeDidChanged themeMaker:@escaping (Bool)->()) {
            themeMakers.append(themeMaker)
        }
        
        static private func themeDidChanged() {
            let aproxies = proxies
            let alight = light
            DispatchQueue.main.async {
                UIView.animate(withDuration: 0.3, animations: {
                    for p in aproxies {
                        if let _ = p.target?.perform(p.action, with: p.themeMaker(alight)) {}
                    }
                    
                    for t in themeMakers {
                        t(alight)
                    }
                })
            }
        }
    }
}
