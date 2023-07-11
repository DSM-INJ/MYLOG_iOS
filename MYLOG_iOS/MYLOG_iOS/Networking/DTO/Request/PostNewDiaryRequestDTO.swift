//
//  PostNewDiaryRequestDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Foundation

public struct PostNewDiaryRequestDTO: Codable {
    public let id: String
    public let title: String
    public let content: String
    public let weather: String
    public let star_score: String
    public let sleep_time: Int
    public let sports_time: Int
    
    public init(id: String, title: String, content: String, weather: String, star_score: String, sleep_time: Int, sports_time: Int) {
        self.id = id
        self.title = title
        self.content = content
        self.weather = weather
        self.star_score = star_score
        self.sleep_time = sleep_time
        self.sports_time = sports_time
    }
    
//    enum CodingKeys: String, CodingKey {
//        case id, title, content, weather
//        case starScore = "star_score"
//        case sleepTime = "sleep_time"
//        case sportTime = "sports_time"
//    }
}
