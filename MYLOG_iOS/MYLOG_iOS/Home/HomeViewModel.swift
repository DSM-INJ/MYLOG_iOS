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
    @Published var stars = 0
    
    @Published var response: FeedEntity?
    
    private let remoteDataSourceImpl = RemoteDataSourceImpl()
    
    func onAppear() {
        addCancellable(
            remoteDataSourceImpl.fetchDetailFeed(selectedDate.now())
        ) { [weak self] data in
            self?.response = data
            
            switch data.starScore {
            case "ONE":
                self?.stars = 1
            case "TWO":
                self?.stars = 2
            case "THREE":
                self?.stars = 3
            case "FOUR":
                self?.stars = 4
            case "FIVE":
                self?.stars = 5
            default:
                print("nothing")
            }
        } onReceiveError: { [weak self] _ in
            self?.isErrorOcuured = true
            self?.errorMessage = "데이터를 불러오지 못했어요. 다시 시도해주세요."
        }
    }
}
