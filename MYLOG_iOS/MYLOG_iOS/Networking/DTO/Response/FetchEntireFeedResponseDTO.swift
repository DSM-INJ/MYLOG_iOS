//
//  FetchEntireFeedResponseDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Foundation

public struct FetchEntireFeedResponseDTO: Decodable {
    public let list : [FetchDetailFeedResponseDTO]
    
    enum CodingKeys: String, CodingKey {
        case list = "feed_list"
    }
}
