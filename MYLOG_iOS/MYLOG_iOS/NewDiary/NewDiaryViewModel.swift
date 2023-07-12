//
//  NewDiaryViewModel.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import SwiftUI
import Combine

final class NewDiaryViewModel: BaseViewModel {
    @Published var isShowingToast = false
    @Published var toastMessage = ""
    
    @Published var selectedWeather: String = ""
    @Published var textFieldString: String = ""
    @Published var textEditorString: String = ""
    @Published var starCount: String = ""
    @Published var sleepTime: String = ""
    @Published var sportsTime: String = ""
    
    @Published var selectedImage: UIImage?
    
    private let remoteDataSourceImpl = RemoteDataSourceImpl()
    
    func sendButtonDidTap() {
        self.postNewDiary()
        self.uploadImage()
    }
    private func postNewDiary() {
        addCancellable(
            remoteDataSourceImpl.postNewDiary(
                .init(
                    id: now(),
                    title: textFieldString,
                    content: textEditorString,
                    weather: selectedWeather,
                    star_score: starCount,
                    sleep_time: Int(sleepTime) ?? 0,
                    sports_time: Int(sportsTime) ?? 0
                )
            )
        ) { [weak self] _ in
            self?.toastMessage = "일기 작성이 완료되었습니다."
            self?.isShowingToast = true
            self?.selectedWeather = ""
            self?.textFieldString = ""
            self?.textEditorString = ""
            self?.starCount = ""
            self?.sleepTime = ""
            self?.sportsTime = ""
            
        } onReceiveError: { [weak self] _ in
            self?.toastMessage = "문제가 발생했습니다. 다시 시도해주세요."
            self?.isShowingToast = true
        }
    }
    private func uploadImage() {
        guard let data = selectedImage?.jpegData(compressionQuality: 0.5) else { return }
        addCancellable(
            remoteDataSourceImpl.postNewImage(now(), data)
        ) { [weak self] _ in
            self?.isShowingToast = true
            self?.toastMessage = "이미지를 성공적으로 업로드 했습니다."
        } onReceiveError: { [weak self] _ in
            self?.errorMessage = "이미지를 업로드 하지 못했습니다. 다시 시도해주세요."
            self?.isErrorOcuured = true
        }
    }
}
