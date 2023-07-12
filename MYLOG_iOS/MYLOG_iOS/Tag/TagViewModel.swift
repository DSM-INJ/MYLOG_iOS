//
//  NewDiaryViewModel.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import SwiftUI
import Combine

final class TagViewModel: BaseViewModel {
    @Published var textFieldString: String = ""
    @Published var results: [SearchResultEntity] = []
    
    private let remoteDataSourceImpl = RemoteDataSourceImpl()
    
    func onChage() {
        print("hi",textFieldString)
        addCancellable(
            remoteDataSourceImpl.searchKeyword(textFieldString)
        ) { [weak self] data in
            self?.results = data
            print("nonno")
            print(self?.results as Any)
            print(data)
        } onReceiveError: { error in
            self.isErrorOcuured = true
            self.errorMessage = "데이터 로딩 실패"
        }
    }
}
