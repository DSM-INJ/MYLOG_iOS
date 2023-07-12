//
//  SearchKeywordResponseDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/12.
//

import Foundation

typealias SearchListDTO = [SearchKeywordResponseDTO]

public struct SearchKeywordResponseDTO: Decodable {
    public init(id: String, title: String, content: String, weather: String, sleepTime: Int, sportsTime: Int, image: String, starScore: String) {
        self.id = id
        self.title = title
        self.content = content
        self.weather = weather
        self.sleepTime = sleepTime
        self.sportsTime = sportsTime
        self.image = image
        self.starScore = starScore
    }
    
    public let id: String
    public let title: String
    public let content: String
    public let weather: String
    public let sleepTime: Int
    public let sportsTime: Int
    public let image: String
    public let starScore: String
}
