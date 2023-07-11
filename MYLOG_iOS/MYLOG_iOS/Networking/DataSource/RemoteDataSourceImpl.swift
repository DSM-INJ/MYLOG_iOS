//
//  RemoteDataSourceImpl.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/11.
//

import Foundation
import Combine

public final class RemoteDataSourceImpl: BaseRemoteDataSource<API>, RemoteDataSource {
    public func fetchEntireFeed() -> AnyPublisher<[FeedEntity], Error> {
        request(.fetchEntireFeed, dto: FetchEntireFeedResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func fetchDetailFeed(_ feedID: String) -> AnyPublisher<FeedEntity, Error> {
        request(.fetchDetailFeed(feedID), dto: FetchDetailFeedResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func postNewDiary(_ req: PostNewDiaryRequestDTO) -> AnyPublisher<Void, Error> {
        request(.postNewDiary(req))
            .eraseToAnyPublisher()
    }
    
    public func postNewImage(_ id: String, _ image: Data) -> AnyPublisher<Void, Error> {
        request(.postNewImage(id, image))
            .eraseToAnyPublisher()
    }
    
    
}
