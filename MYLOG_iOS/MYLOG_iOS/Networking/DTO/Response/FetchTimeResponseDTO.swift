//
//  FetchSleepTimeResponseDTO.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/12.
//

import Foundation

public struct FetchTimeResponseDTO: Decodable {
    public let sunday, monday, tuesday, wednesday, thursday, friday, saturday: Int
    
    public init(sunday: Int, monday: Int, tuesday: Int, wednesday: Int, thursday: Int, friday: Int, saturday: Int) {
        self.sunday = sunday
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
    }
    
    public enum CodingKeys: CodingKey {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday
    }
}


public extension FetchTimeResponseDTO {
    func toDomain() -> FetchTimeResponseDTO {
        FetchTimeResponseDTO(
            sunday: sunday,
            monday: monday,
            tuesday: tuesday,
            wednesday: wednesday,
            thursday: thursday,
            friday: friday,
            saturday: saturday
        )
    }
}
