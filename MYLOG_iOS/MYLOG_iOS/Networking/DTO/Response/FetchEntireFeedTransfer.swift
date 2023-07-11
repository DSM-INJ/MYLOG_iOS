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
        let formatter = ISO8601DateFormatter()
        formatter.formatOptions = [.withFullDate]
        let string = formatter.string(from: createdAt)
        let date = formatter.date(from: string) ?? .init()
        
        return FeedEntity(content: content, createdAt: date, image: image, sleepTime: sleepTime, sportsTime: sportsTime, starScore: starScore, title: title, weather: weather)
    }
}
