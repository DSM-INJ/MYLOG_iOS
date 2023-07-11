//
//  FeedEntity.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import Foundation

public struct FeedEntity: Equatable, Hashable {
    public init(content: String, createdAt: Date, image: String, sleepTime: Int, sportsTime: Int, starScore: String, title: String, weather: String) {
        self.content = content
        self.createdAt = createdAt
        self.image = image
        self.sleepTime = sleepTime
        self.sportsTime = sportsTime
        self.starScore = starScore
        self.title = title
        self.weather = weather
    }

    public let content: String
    public let createdAt: Date
    public let image: String
    public let sleepTime: Int
    public let sportsTime: Int
    public let starScore: String
    public let title: String
    public let weather: String
}
