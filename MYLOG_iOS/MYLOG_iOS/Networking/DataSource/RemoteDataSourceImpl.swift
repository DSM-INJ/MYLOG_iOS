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
    
    public func searchKeyword(_ keyword: String) -> AnyPublisher<[SearchResultEntity], Error> {
        request(.searchKeyword(keyword), dto: SearchListDTO.self)
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

    public func fetchSleepTime() -> AnyPublisher<FetchTimeResponseDTO, Error> {
        request(.fetchSleepTime, dto: FetchTimeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }

    public func fetchSportsTime() -> AnyPublisher<FetchTimeResponseDTO, Error> {
        request(.fetchSportsTime, dto: FetchTimeResponseDTO.self)
            .map { $0.toDomain() }
            .eraseToAnyPublisher()
    }
    
    public func fetchSatisfaction() -> AnyPublisher<String, Error> {
        request(.fetchSatisfaction, dto: FetchSatisfactionResponseDTO.self)
            .map(\.satisfaction)
            .eraseToAnyPublisher()
    }
    
    func filErr(err: Error) {
        print(err.localizedDescription)
    }
    
    
}
