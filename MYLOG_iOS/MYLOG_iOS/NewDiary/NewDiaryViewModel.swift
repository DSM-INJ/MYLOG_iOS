//
//  NewDiaryViewModel.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2023/07/10.
//

import SwiftUI
import Combine

final class NewDiaryViewModel: BaseViewModel {
    @Published var selectedWeather: WeatherType?
    @Published var textFieldString: String = ""
    @Published var textEditorString: String = ""
}
