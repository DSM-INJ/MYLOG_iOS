//
//  SearchResultResponseDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/12.
//

import Foundation
import Combine

public extension SearchListDTO {
    func toDomain() -> [SearchResultEntity] {
        return self.map {
            $0.toDomain()
        }
    }
}

public extension SearchKeywordResponseDTO {
    func toDomain() -> SearchResultEntity {
        return SearchResultEntity(id: id, title: title, content: content, weather: weather, sleepTime: sleepTime, sportsTime: sportsTime, image: image, starScore: starScore)
    }
}
