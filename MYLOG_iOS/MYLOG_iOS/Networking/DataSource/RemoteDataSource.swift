//
//  RemoteDataSource.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Combine
import Foundation

public protocol RemoteDataSource {
    func fetchEntireFeed() -> AnyPublisher<[FeedEntity], Error>
    func fetchDetailFeed(_ feedID: String) -> AnyPublisher<FeedEntity, Error>
    
    func searchKeyword(_ keyword: String) -> AnyPublisher<[SearchResultEntity], Error>
    
    func postNewDiary(_ req: PostNewDiaryRequestDTO) -> AnyPublisher<Void, Error>
    func postNewImage(_ id: String, _ image: Data) -> AnyPublisher<Void, Error>
    
    func fetchSleepTime() -> AnyPublisher<FetchTimeResponseDTO, Error>
    func fetchSportsTime() -> AnyPublisher<FetchTimeResponseDTO, Error>
    func fetchSatisfaction() -> AnyPublisher<String, Error>
}
