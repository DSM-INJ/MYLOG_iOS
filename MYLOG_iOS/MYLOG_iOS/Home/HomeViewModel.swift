//
//  NewDiaryViewModel.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import SwiftUI
import Combine

class HomeViewModel: BaseViewModel {
    @Published var selectedDate = Date()
    @Published var selectedDateString = ""
    @Published var selectedWeather: WeatherType?
    @Published var textFieldString: String = ""
    @Published var textEditorString: String = ""
    @Published var imageURL: String = ""
    @Published var starCount: String = ""
    @Published var sleepTime: Int = 0
    @Published var sportsTime: Int = 0
    
    @Published var response: FeedEntity?
    
//    init(response: FeedEntity?) {
//        self.response = response
//    }
    
    private let remoteDataSourceImpl = RemoteDataSourceImpl()
    
    func onAppear() {
        addCancellable(
            remoteDataSourceImpl.fetchDetailFeed(selectedDateString)
        ) { [weak self] data in
//            switch data.weather {
//            case "SUNNY":
//                self?.selectedWeather = .SUNNY
//            case "CLOUDY":
//                self?.selectedWeather = .CLOUDY
//            case "RAINY":
//                self?.selectedWeather = .RAINY
//            case "SNOW":
//                self?.selectedWeather = .SNOW
//            default:
//                print("Nothing Transfered")
//            }
//
//            self?.textFieldString = data.title
//            self?.textEditorString = data.content
//            self?.imageURL = data.image
//            self?.starCount = data.starScore
//            self?.sleepTime = data.sleepTime
//            self?.sportsTime = data.sportsTime
            self?.response = data
        }
    }
}
