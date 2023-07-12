//
//  Client.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import Foundation
import Moya
import Combine

public enum API {
    // Main
    case fetchEntireFeed
    case fetchDetailFeed(_ feedID: String)
    
    // Tag
    case searchKeyword(_ keyword: String)
    
    // NewDiary
    case postNewDiary(_ req: PostNewDiaryRequestDTO)
    case postNewImage(_ id: String, _ image: Data)
    
    // Chart
    case fetchSleepTime
    case fetchSportsTime
    case fetchSatisfaction
}

extension API: BaseAPI {
    public typealias ErrorType = BaseErrorType
    
    public var urlPath: String {
        switch self {
        case .fetchEntireFeed:
            return "/feed/list"
        case let .fetchDetailFeed(id):
            return "/feed/\(id)"
        case .searchKeyword:
            return "/feed/search"
        case .postNewDiary, .fetchSleepTime, .fetchSportsTime, .fetchSatisfaction:
            return "/feed"
        case let .postNewImage(id, _):
            return "/feed/upload/\(id)"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .fetchEntireFeed, .fetchDetailFeed, .searchKeyword, .fetchSleepTime, .fetchSportsTime, .fetchSatisfaction:
            return .get
        case .postNewDiary:
            return .post
        case .postNewImage:
            return .patch
        }
    }
    
    public var task: Moya.Task {
        switch self {
        case let .searchKeyword(keyword):
            return .requestParameters(
                parameters: [
                    "keyword": keyword
                ],
                encoding: URLEncoding.queryString
            )
        case let .postNewDiary(req):
            return .requestJSONEncodable(req)
        case let .postNewImage(_, image):
            return .uploadMultipart([
                .init(
                    provider: .data(image),
                    name: "photo",
                    fileName: "\(UUID().uuidString).jpeg"
                )
            ])
        default:
            return .requestPlain
        }
    }
    
    public var errorMap: [Int : BaseErrorType] {
        switch self {
        default:
            return [
                400: .badRequest,
                401: .unauthorized,
                403: .forbidden,
                404: .notFound,
                409: .conflict
            ]
        }
    }
}
