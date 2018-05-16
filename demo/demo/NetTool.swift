//
//  netTool.swift
//  demo
//
//  Created by KPC on 2018/5/16.
//  Copyright © 2018年 KPC. All rights reserved.
//

import UIKit
import Moya
import SwiftyJSON
import RxSwift

public enum netTool {
    
    case zen
    case userProfile(String)

}


// MARK: - get请求 https://api.github.com/zen  https://api.github.com/users/ashfurrow
extension netTool: Moya.TargetType {
    public var baseURL: URL {
        return URL(string: "https://api.github.com")!
    }
    
    public var path: String {
        switch self {
        case .zen:
            return "/zen"
        case .userProfile(let name):
            return "/users/\(name)"
        }
    }
    
    public var method: Moya.Method {
        return .get
    }
    
    public var sampleData: Data {
        return "Test data".data(using: .utf8)!
    }
    
    public var task: Moya.Task {
        switch self {
        default:
            return .requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return nil
    }
}





extension ObservableType where E == JSON {
    public func mapObject<T: Parseable>(to type: T.Type) -> Observable<T> {
        return flatMap { json -> Observable<T> in
            return Observable.just(json.mapObject(to: type))
        }
    }
}

fileprivate extension JSON {
    fileprivate func mapObject<T: Parseable>(to type: T.Type) -> T {
        return T(json: self)
    }
}



public extension ObservableType where E == Moya.Response {
    
    public func myMapJSON() -> Observable<JSON> {
        return flatMap{ (response) -> Observable<JSON> in
            return Observable.just(try response.mapToJSON())
        }
    }
}

fileprivate extension Moya.Response {
    
    fileprivate func mapToJSON() throws -> JSON {
        do {
            let json = try JSON(mapJSON())
            print("\n🐶🐶🐶\n\(json)\n🐶🐶🐶")
            return json
        } catch {
            throw Moya.MoyaError.jsonMapping(self)
        }
    }
    
}

