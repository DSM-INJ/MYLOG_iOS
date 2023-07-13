//
//  BaseAPI.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import Foundation
import Moya

public protocol BaseAPI: TargetType {
    associatedtype ErrorType: Error
    var urlPath: String { get }
    var errorMap: [Int: ErrorType] { get }
}

public extension BaseAPI {
    var baseURL: URL {
        return URL(string: "https://29e0-14-50-190-128.ngrok-free.app")!
    }

    var path: String {
        urlPath
    }

    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }

    var validationType: ValidationType {
        return .successCodes
    }
}
