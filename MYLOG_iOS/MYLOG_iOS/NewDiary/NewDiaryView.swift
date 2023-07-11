//
//  NewDiaryView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI

struct NewDiaryView: View {
    @StateObject var viewModel: NewDiaryViewModel
    @State var isShowingImagePicker = false
    @State var starRating = 0
    private let date = Date()
    
    init(
        viewModel: NewDiaryViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            ScrollView(showsIndicators: false) {
                ZStack(alignment: .trailing) {
                    VStack(alignment: .center) {
                        HStack(alignment: .center) {
                            VStack {
                                Text(date.nowDay())
                                    .foregroundColor(.black)
                                    .frame(height: 40, alignment: .top)
                                    .font(.system(size: 40, weight: .bold))
                                    .padding(.leading, 3)
                                Text(date.nowWeekDay())
                                    .foregroundColor(
                                        date.nowWeekDay() == "SUN" ? Color("RedColor") :
                                            (date.nowWeekDay() == "SAT" ? Color("BlueColor"): Color("SubtitleColor")))
                                    .frame(height: 22, alignment: .top)
                                    .font(.system(size: 15, weight: .medium))
                                    .padding(.leading, 2)
                            }
                            .padding(.trailing, 32)
                            
                            VStack(alignment: .leading) {
                                Text("Today")
                                    .foregroundColor(.black)
                                    .frame(height: 25, alignment: .top)
                                    .font(.system(size: 20, weight: .semibold))
                                HStack {
                                    weatherItem(.SUNNY)
                                        .frame(width: 34)
                                        .foregroundColor(viewModel.selectedWeather == "SUNNY" ? Color("SunColor") : Color("ShadowColor").opacity(0.1))
                                        .padding(.trailing, 14)
                                        .onTapGesture {
                                            viewModel.selectedWeather = WeatherType.SUNNY.rawValue
                                        }
                                    
                                    ZStack {
                                        if viewModel.selectedWeather == "CLOUDY" {
                                            Image("CLOUD")
                                                .resizable()
                                                .frame(width: 43)
                                                .padding(.trailing, 19)
                                        }
                                        
                                        weatherItem(.CLOUDY)
                                            .frame(width: 43)
                                            .foregroundColor(viewModel.selectedWeather == "CLOUDY" ? .clear : Color("ShadowColor").opacity(0.1))
                                            .onTapGesture {
                                                viewModel.selectedWeather = WeatherType.CLOUDY.rawValue
                                            }
                                            .padding(.trailing, 19)
                                    }
                                    
                                    weatherItem(.RAINY)
                                        .frame(width: 30)
                                        .foregroundColor(viewModel.selectedWeather == "RAINY" ? Color("RainColor") : Color("ShadowColor").opacity(0.1))
                                        .onTapGesture {
                                            viewModel.selectedWeather = WeatherType.RAINY.rawValue
                                        }
                                        .padding(.trailing, 19)
                                    
                                    weatherItem(.SNOW)
                                        .frame(width: 30)
                                        .foregroundColor(viewModel.selectedWeather == "SNOW" ? Color("CloudColor") : Color("ShadowColor").opacity(0.1))
                                        .onTapGesture {
                                            viewModel.selectedWeather = WeatherType.SNOW.rawValue
                                        }
                                }
                                .frame(height: 30)
                            }
                            
                            Spacer()
                        }
                        
                        Divider()
                            .background(Color("SeparatorColor"))
                            .padding(.bottom, 20)
                        
                        Button {
                            isShowingImagePicker.toggle()
                        } label: {
                            Group {
                                if let image = viewModel.selectedImage {
                                    Image(uiImage: image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 338, height: 338)
                                        .clipShape(Rectangle())
                                        .cornerRadius(20, corners: .allCorners)
                                } else {
                                    VStack {
                                        Image(systemName: "photo.on.rectangle")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 280)
                                            .padding(.bottom, 10)
                                        Text("새 이미지 추가하기")
                                    }
                                    .foregroundColor(Color("MainColor"))
                                }
                            }
                        }
                        .padding(.bottom, 28)
                        
                        VStack(alignment: .leading) {
                            TextField("일기 제목을 입력하세요.", text: $viewModel.textFieldString) {
                                hideKeyboard()
                            }
                            .foregroundColor(Color("LargeTitleColor"))
                            .font(.system(size: 20, weight: .bold))
                            .autocorrectionDisabled()
                            .textFieldStyle(PlainTextFieldStyle())
                            .padding(.horizontal, 4)
                            
                            ZStack(alignment: .topLeading) {
                                TextEditor(text: $viewModel.textEditorString)
                                    .padding(.horizontal, 4)
                                    .font(.system(size: 17, weight: .regular))
                                    .foregroundColor(Color("SubtitleColor"))
                                    .autocorrectionDisabled()
                                    .multilineTextAlignment(.leading)
                                
                                if viewModel.textEditorString.isEmpty {
                                    Text("일기 내용을 입력하세요.")
                                        .foregroundColor(Color("ShadowColor"))
                                        .font(.system(size: 17, weight: .regular))
                                        .padding(.top, 4)
                                        .padding(.horizontal, 6)
                                }
                            }
                            .padding(.bottom, 82)
                            
                            HStack {
                                Text("오늘 나의 하루")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundColor(Color("ShadowColor"))
                                    .padding(.trailing, 18)
                                
                                ForEach(1...5, id: \.self) { num in
                                    countStars(for: num)
                                        .font(.system(size: 13, weight: .regular))
                                        .foregroundColor(num > starRating ? Color("TodayColor") : Color("SunColor"))
                                        .onTapGesture {
                                            starRating = num
                                            switch starRating {
                                            case 1:
                                                viewModel.starCount = StarScore.ONE.rawValue
                                            case 2:
                                                viewModel.starCount = StarScore.TWO.rawValue
                                            case 3:
                                                viewModel.starCount = StarScore.THREE.rawValue
                                            case 4:
                                                viewModel.starCount = StarScore.FOUR.rawValue
                                            case 5:
                                                viewModel.starCount = StarScore.FIVE.rawValue
                                            default:
                                                print("Nothing")
                                            }
                                            print(viewModel.starCount)
                                        }
                                }
                                .padding(.top, -2)
                            }
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: "bed.double.fill")
                                    .font(.system(size: 25, weight: .semibold))
                                    .foregroundColor(Color("TodayColor"))
                                    .padding(.trailing, 2)
                                
                                TextField("수면 시간 입력", text: $viewModel.sleepTime)
                                    .frame(width: 84, height: 34)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 1)
                                    )
                                    .foregroundColor(Color("ShadowColor"))
                                    .textFieldStyle(.roundedBorder)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.top, 10)
                            
                            HStack(alignment: .center, spacing: 10) {
                                Image(systemName: "dumbbell.fill")
                                    .font(.system(size: 25, weight: .semibold))
                                    .foregroundColor(Color("TodayColor"))
                                TextField("운동 시간 입력", text: $viewModel.sportsTime)
                                    .frame(width: 84, height: 34)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(lineWidth: 1)
                                    )
                                    .foregroundColor(Color("ShadowColor"))
                                    .textFieldStyle(.roundedBorder)
                                    .font(.system(size: 12, weight: .regular))
                            }
                            .padding(.top, 10)
                        }
                        
                        Spacer(minLength: 300)
                    }
                }
            }
            .padding(.top, 30)
            .padding(.horizontal, 24)
            
            Button {
                viewModel.sendButtonDidTap()
            } label: {
                ZStack(alignment: .leading) {
                    Color("TabBarColor")
                    Text("작성 완료")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .offset(x: 14)
                    Image(systemName: "checkmark")
                        .foregroundColor(.white)
                        .font(.system(size: 20, weight: .bold))
                        .offset(x: 94, y: -2)
                }
                .frame(width: 130, height: 50)
                .cornerRadius(16, corners: .allCorners)
                .padding(.bottom, 34)
                .padding(.trailing, 26)
            }
        }
        .navigationBarHidden(true)
        .onTapGesture {
            hideKeyboard()
        }
        .imagePicker(isShow: $isShowingImagePicker, uiImage: $viewModel.selectedImage)
        .toast(isShowing: $viewModel.isShowingToast, message: viewModel.toastMessage, style: .success)
        .toast(isShowing: $viewModel.isErrorOcuured, message: viewModel.errorMessage, style: .error)
    }
    
    func countStars(for number: Int) -> Image {
        var offImage: Image?
        
        if number > starRating {
            return offImage ?? Image(systemName: "star.fill")
        } else {
            return Image(systemName: "star.fill")
        }
    }
}

struct NewDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        NewDiaryView(viewModel: NewDiaryViewModel())
    }
}

@ViewBuilder
public func weatherItem(_ type: WeatherType) -> some View {
    Image("\(type.rawValue)")
        .resizable()
}
public enum WeatherType: String {
    case SUNNY
    case CLOUDY
    case RAINY
    case SNOW
}

public enum StarScore: String {
    case ONE
    case TWO
    case THREE
    case FOUR
    case FIVE
}
