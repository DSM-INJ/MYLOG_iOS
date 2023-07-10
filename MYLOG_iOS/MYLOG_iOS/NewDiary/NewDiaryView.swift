//
//  NewDiaryView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI

struct NewDiaryView: View {
    @StateObject var viewModel: NewDiaryViewModel
    
    init(
        viewModel: NewDiaryViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    VStack {
                        Text("6")
                            .foregroundColor(.black)
                            .frame(height: 40, alignment: .top)
                            .font(.system(size: 40, weight: .bold))
                            .padding(.leading, 3)
                        Text("SAT")
                            .foregroundColor(Color("BlueColor"))
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
                                .foregroundColor(viewModel.selectedWeather == .SUNNY ? Color("SunColor") : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 14)
                                .onTapGesture {
                                    viewModel.selectedWeather = WeatherType.SUNNY
                                }
                            
                            ZStack {
                                if viewModel.selectedWeather == .CLOUDY {
                                    Image("CLOUD")
                                        .resizable()
                                        .frame(width: 43)
                                        .padding(.trailing, 19)
                                }
                                
                                weatherItem(.CLOUDY)
                                    .frame(width: 43)
                                    .foregroundColor(viewModel.selectedWeather == .CLOUDY ? .clear : Color("ShadowColor").opacity(0.1))
                                    .onTapGesture {
                                        viewModel.selectedWeather = WeatherType.CLOUDY
                                    }
                                    .padding(.trailing, 19)
                            }
                            
                            weatherItem(.RAINY)
                                .frame(width: 30)
                                .foregroundColor(viewModel.selectedWeather == .RAINY ? Color("RainColor") : Color("ShadowColor").opacity(0.1))
                                .onTapGesture {
                                    viewModel.selectedWeather = WeatherType.RAINY
                                }
                                .padding(.trailing, 19)
                            
                            weatherItem(.SNOW)
                                .frame(width: 30)
                                .foregroundColor(viewModel.selectedWeather == .SNOW ? Color("CloudColor") : Color("ShadowColor").opacity(0.1))
                                .onTapGesture {
                                    viewModel.selectedWeather = WeatherType.SNOW
                                }
                        }
                        .frame(height: 30)
                    }
                    
                    Spacer()
                }
                
                Divider()
                    .background(Color("SeparatorColor"))
                    .padding(.bottom, 20)
                
                Image("SampleImage")
                    .resizable()
                    .frame(width: 338, height: 338)
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
                }
                
                Spacer(minLength: 300)
            }
        }
        .navigationBarHidden(true)
        .padding(.top, 30)
        .padding(.horizontal, 24)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct NewDiaryView_Previews: PreviewProvider {
    static var previews: some View {
        NewDiaryView(viewModel: NewDiaryViewModel())
    }
}

@ViewBuilder
func weatherItem(_ type: WeatherType) -> some View {
    Image("\(type.rawValue)")
        .resizable()
}
public enum WeatherType: String {
    case SUNNY
    case CLOUDY
    case RAINY
    case SNOW
}
