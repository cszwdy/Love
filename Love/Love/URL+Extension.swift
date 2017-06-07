//
//  URL+Extension.swift
//  Love
//
//  Created by Emiaostein on 24/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

extension URL {
    enum PreviewMode {
        case zero(Int, Int) //w, h
        case one(Int, Int)
        case two(Int, Int)
        case three(Int, Int)
        case four(Int, Int)
        case five(Int, Int)
        
        
        var toString: String {
            var str = ""
            switch self {
            case .zero(let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/0" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            case .one(let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/1" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            case .two(let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/2" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            case .three (let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/3" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            case .four(let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/4" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            case .five(let w, let h):
                if w > 0 || h > 0 { str = "?imageView2/5" + (w > 0 ? "/w/\(w)" : "") + (h > 0 ? "/h/\(h)" : ""); break}
            }
            return  str
        }
    }
    
    // for qiniu image preview API: https://developer.qiniu.com/dora/manual/1279/basic-processing-images-imageview2
    func makePreviewURL(by mode: PreviewMode) -> URL {
        let str = mode.toString
        return str.isEmpty ? self : URL(string: absoluteString.appending(str))!
    }
}
