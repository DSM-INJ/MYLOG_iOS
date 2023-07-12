//
//  FetchEntireFeedTransfer.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Foundation
import Combine

public extension FetchEntireFeedResponseDTO {
    func toDomain() -> [FeedEntity] {
        list.map { $0.toDomain() }
    }
}

public extension FetchDetailFeedResponseDTO {
    func toDomain() -> FeedEntity {
        return FeedEntity(title: title, content: content, sportsTime: sportsTime, sleepTIme: sleepTIme, starScore: starScore, weather: weather, image: image)
    }
}
