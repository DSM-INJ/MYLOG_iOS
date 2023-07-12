//
//  TagView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI
import Kingfisher

struct TagView: View {
    @StateObject var viewModel: TagViewModel

    init(
        viewModel: TagViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        ScrollView(showsIndicators: false){
            VStack(alignment: .leading) {
                Text("일기 검색")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color("TitleColor"))
                    .padding(.top, 42)
                    .padding(.horizontal, 28)
                
                ZStack(alignment: .leading) {
                    Rectangle()
                        .fill(.white)
                        .frame(height: 65)
                        .cornerRadius(20, corners: .allCorners)
                        .padding(.horizontal, 30)
                        .shadow(color: .black.opacity(0.15), x: 0, y: 4, blur: 15, spread: 0)
                    Image(systemName: "number")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("MainColor"))
                        .offset(x: 50)
                    TextField("검색어를 입력하세요.", text: $viewModel.textFieldString) {
                        hideKeyboard()
                    }
                    .frame(width: 250)
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("SubtitleColor"))
                    .offset(x: 88)
                    
                    Button {
                        viewModel.onChage()
                    } label: {
                        Image(systemName: "magnifyingglass.circle.fill")
                            .resizable()
                            .frame(width: 38, height: 38)
                            .foregroundColor(Color("MainColor"))
                    }
                    .offset(x: 340)
                }
                .padding(.bottom, 45)
                
                if !viewModel.textFieldString.isEmpty {
                    Text("'\(viewModel.textFieldString)' 검색 결과입니다.")
                        .font(.system(size: 18, weight: .medium))
                        .foregroundColor(Color("TodayColor"))
                        .padding(.bottom, 20)
                        .padding(.horizontal, 30)
                }
                LazyVStack {
                    ForEach(viewModel.results, id: \.self) { list in
                        cellView(list)
                            .padding(.bottom, 30)
                    }
                }
                .padding(.top, 20)
                .padding(.horizontal, 30)
            }
        }
        .onTapGesture {
            hideKeyboard()
            print(viewModel.results)
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(viewModel: TagViewModel())
    }
}


@ViewBuilder
func cellView(_ results: SearchResultEntity) -> some View {
    ZStack(alignment: .center) {
        Color.white
        
        VStack(alignment: .leading) {
            Spacer(minLength: 25)
            
            HStack(alignment: .center) {
                VStack(alignment: .center) {
                    Text(results.id.nowDay().nowDay())
                        .foregroundColor(.black)
                        .frame(height: 40, alignment: .top)
                        .font(.system(size: 40, weight: .bold))
                        .padding(.leading, 3)
                    Text(results.id.nowWeekDay().nowWeekDay())
                        .foregroundColor(
                            results.id.nowWeekDay().nowWeekDay() == "SUN" ? Color("RedColor") :
                                (results.id.nowWeekDay().nowWeekDay() == "SAT" ? Color("BlueColor"): Color("SubtitleColor")))
                        .frame(height: 22, alignment: .top)
                        .font(.system(size: 15, weight: .medium))
                        .padding(.leading, 2)
                }
                .padding(.trailing, 32)
                
                VStack(alignment: .leading) {
                    Text("Weather")
                        .foregroundColor(.black)
                        .frame(height: 25, alignment: .top)
                        .font(.system(size: 20, weight: .semibold))
                    HStack {
                        weatherItem(.SUNNY)
                            .frame(width: 34)
                            .foregroundColor(results.weather == "SUNNY" ? Color("SunColor") : Color("ShadowColor").opacity(0.1))
                            .padding(.trailing, 14)
                        
                        ZStack {
                            if results.weather == "CLOUDY" {
                                Image("CLOUD")
                                    .resizable()
                                    .frame(width: 43)
                                    .padding(.trailing, 19)
                            }
                            
                            weatherItem(.CLOUDY)
                                .frame(width: 43)
                                .foregroundColor(results.weather == "CLOUDY" ? .clear : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 19)
                        }
                        
                        weatherItem(.RAINY)
                            .frame(width: 30)
                            .foregroundColor(results.weather == "RAINY" ? Color("RainColor") : Color("ShadowColor").opacity(0.1))
                            .padding(.trailing, 19)
                        
                        weatherItem(.SNOW)
                            .frame(width: 30)
                            .foregroundColor(results.weather == "SNOW" ? Color("CloudColor") : Color("ShadowColor").opacity(0.1))
                    }
                    .frame(height: 30)
                }
                
                Spacer()
            }
            
            Divider()
                .background(Color("SeparatorColor"))
                .padding(.bottom, 20)
            
            HStack(alignment: .center) {
                Spacer()
                
                KFImage(URL(string: results.image))
                    .placeholder {
                        Image(systemName: "photo.on.rectangle")
                            .aspectRatio(contentMode: .fill)
                    }
                    .resizable()
                    .frame(width: 338, height: 338, alignment: .center)
                    .cornerRadius(15, corners: .allCorners)
                    .padding(.bottom, 28)
                
                Spacer()
            }
            
            Text(results.title)
                .foregroundColor(Color("LargeTitleColor"))
                .font(.system(size: 20, weight: .bold))
                .padding(.horizontal, 4)
                .padding(.bottom, 2)
            
            Text(results.content)
                .font(.system(size: 17, weight: .regular))
                .foregroundColor(Color("SubtitleColor"))
                .padding(.horizontal, 4)
                .padding(.bottom, 40)
            
            
            Text("오늘 나의 하루")
                .font(.system(size: 18, weight: .semibold))
                .foregroundColor(Color("ShadowColor"))
                .padding(.trailing, 18)
            
            
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: "bed.double.fill")
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("TodayColor"))
                    .padding(.trailing, 2)
                
                Text(String(results.sleepTime))
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
                
                Text(String(results.sportsTime))
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
            
            
            Spacer(minLength: 30)
        }
        .padding(.horizontal, 24)
    }
    .cornerRadius(25, corners: .allCorners)
    .shadow(color: .black.opacity(0.1), x: 0, y: -2, blur: 20, spread: 0)
    .padding(.horizontal, 30)
}

func countStars(for number: Int) -> Image {
    var offImage: Image?
    
    if number > 0 {
        return offImage ?? Image(systemName: "star.fill")
    } else {
        return Image(systemName: "star.fill")
    }
}
