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
    
    @Published var response: FeedEntity?
    
    private let remoteDataSourceImpl = RemoteDataSourceImpl()
    
    func onChange() {
        addCancellable(
            remoteDataSourceImpl.fetchDetailFeed(selectedDate.now())
        ) { [weak self] data in
            self?.response = data
        } onReceiveError: { [weak self] _ in
            self?.isErrorOcuured = true
            self?.errorMessage = "데이터를 불러오지 못했어요. 다시 시도해주세요."
        }
    }
}
