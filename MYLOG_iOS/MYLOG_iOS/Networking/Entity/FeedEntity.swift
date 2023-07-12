//
//  FeedEntity.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import Foundation

public struct FeedEntity: Equatable, Hashable {
    public init(title: String, content: String, sportsTime: Int, sleepTIme: Int, starScore: String, weather: String, image: String) {
        self.title = title
        self.content = content
        self.sportsTime = sportsTime
        self.sleepTIme = sleepTIme
        self.starScore = starScore
        self.weather = weather
        self.image = image
    }
    
    public let title: String
    public let content: String
    public let sportsTime: Int
    public let sleepTIme: Int
    public let starScore: String
    public let weather: String
    public let image: String
}
