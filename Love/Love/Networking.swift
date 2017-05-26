//
//  Request.swift
//  Love
//
//  Created by Emiaostein on 23/05/2017.
//  Copyright © 2017 emiaostein. All rights reserved.
//

import Foundation

typealias JSONParemeter = [String: String]
typealias JSON = [String: Any]

protocol Epsidoe {
    var url: URL {get}
    var parameters: JSONParemeter {get}
}

extension Epsidoe {
    var url: URL {return App.url.domain}
}

struct Resource<A> {
    enum HTTPMethod {
        case get
        case post(JSONParemeter)
        case getDemo(JSONParemeter)
        
        var name: String {
            switch self {
            case .get: return "GET"
            case .post(_): return "POST"
            case .getDemo(_): return "GET"
            }
        }
    }
    
    let url: URL
    let httpMethod: HTTPMethod
    let parse: (Data) -> A?
    
    var request: URLRequest {
        var urls = url
        
        switch httpMethod {
        case .getDemo(let json): urls = urls.appendingQueryParameters(json)
        default: ()
        }
        
        var r = URLRequest(url: urls)
        r.httpMethod = httpMethod.name
        switch httpMethod {
        case .post(let json):
            json.forEach{r.addValue($0.value, forHTTPHeaderField: $0.key)}
        default: ()
        }

        return r
    }
}

extension Resource {
    init(url: URL, httpMethod: HTTPMethod, parseJSON: @escaping ([String: Any]) ->A?) {
        self.url = url
        self.httpMethod = httpMethod
        self.parse = { data in
           let json = try? JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
//            print("json = \(json)")
            return json.flatMap(parseJSON)
        }
    }
}

class WebService {
    class func load<A>(res: Resource<A>, completed: @escaping (A?)->()) {
        URLSession.shared.dataTask(with: res.request) { (data,_,_) in
            let result = data.flatMap(res.parse)
            completed(result)
            }.resume()
    }
}


protocol URLQueryParameterStringConvertible {
    var queryParameters: String {get}
}

extension Dictionary : URLQueryParameterStringConvertible {
    /**
     This computed property returns a query parameters string from the given NSDictionary. For
     example, if the input is @{@"day":@"Tuesday", @"month":@"January"}, the output
     string will be @"day=Tuesday&month=January".
     @return The computed parameters string.
     */
    var queryParameters: String {
        var parts: [String] = []
        for (key, value) in self {
            let part = String(format: "%@=%@",
                              String(describing: key).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!,
                              String(describing: value).addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
            parts.append(part as String)
        }
        return parts.joined(separator: "&")
    }
}

extension URL {
    /**
     Creates a new URL by adding the given query parameters.
     @param parametersDictionary The query parameter dictionary to add.
     @return A new URL.
     */
    func appendingQueryParameters(_ parametersDictionary : Dictionary<String, String>) -> URL {
        let URLString : String = String(format: "%@?%@", self.absoluteString, parametersDictionary.queryParameters)
        return URL(string: URLString)!
    }
}
