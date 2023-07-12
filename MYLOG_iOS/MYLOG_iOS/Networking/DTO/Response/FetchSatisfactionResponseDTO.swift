//
//  FetchSatisfactionResponseDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/12.
//

import Foundation

public struct FetchSatisfactionResponseDTO: Decodable {
    public let satisfaction: String

    public init(satisfaction: String) {
        self.satisfaction = satisfaction
    }
}
