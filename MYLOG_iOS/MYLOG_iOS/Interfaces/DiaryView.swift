import SwiftUI
import Kingfisher

struct DiaryView: View {
    @StateObject var viewModel: HomeViewModel
    
    init(
        viewModel: HomeViewModel
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        UIScrollView.appearance().bounces = false
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                HStack(alignment: .center) {
                    VStack(alignment: .center) {
                        Text(viewModel.selectedDate.nowDay())
                            .foregroundColor(.black)
                            .frame(height: 40, alignment: .top)
                            .font(.system(size: 40, weight: .bold))
                            .padding(.leading, 3)
                        Text(viewModel.selectedDate.nowWeekDay())
                            .foregroundColor(
                                viewModel.selectedDate.nowWeekDay() == "SUN" ? Color("RedColor") :
                                    (viewModel.selectedDate.nowWeekDay() == "SAT" ? Color("BlueColor"): Color("SubtitleColor")))
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
                                .foregroundColor(viewModel.response?.weather == "SUNNY" ? Color("SunColor") : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 14)
                            
                            ZStack {
                                if viewModel.response?.weather == "CLOUDY" {
                                    Image("CLOUD")
                                        .resizable()
                                        .frame(width: 43)
                                        .padding(.trailing, 19)
                                }
                                
                                weatherItem(.CLOUDY)
                                    .frame(width: 43)
                                    .foregroundColor(viewModel.response?.weather == "CLOUDY" ? .clear : Color("ShadowColor").opacity(0.1))
                                    .padding(.trailing, 19)
                            }
                            
                            weatherItem(.RAINY)
                                .frame(width: 30)
                                .foregroundColor(viewModel.response?.weather == "RAINY" ? Color("RainColor") : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 19)
                            
                            weatherItem(.SNOW)
                                .frame(width: 30)
                                .foregroundColor(viewModel.response?.weather == "SNOW" ? Color("CloudColor") : Color("ShadowColor").opacity(0.1))
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
                    
                    KFImage(URL(string: viewModel.response?.image ?? ""))
                        .placeholder {
                            Image(systemName: "photo.on.rectangle")
                                .aspectRatio(contentMode: .fit)
                        }
                        .resizable()
                        .frame(width: 338, height: 338, alignment: .center)
                        .cornerRadius(15, corners: .allCorners)
                        .padding(.bottom, 28)
                    
                    Spacer()
                }
                
                Text(viewModel.response?.title ?? "데이터를 불러오지 못했어요.")
                    .foregroundColor(Color("LargeTitleColor"))
                    .font(.system(size: 20, weight: .bold))
                    .padding(.horizontal, 4)
                    .padding(.bottom, 2)
                
                Text(viewModel.response?.content ?? "데이터를 불러오지 못했어요.")
                    .font(.system(size: 17, weight: .regular))
                    .foregroundColor(Color("SubtitleColor"))
                    .padding(.horizontal, 4)
                    .padding(.bottom, 82)
                
                HStack {
                    Text("오늘 나의 하루")
                        .font(.system(size: 18, weight: .semibold))
                        .foregroundColor(Color("ShadowColor"))
                        .padding(.trailing, 18)
                    
                    ForEach(1...5, id: \.self) { _ in
                        countStars(for: viewModel.stars)
                            .font(.system(size: 13, weight: .regular))
                            .foregroundColor(viewModel.stars > 0 ? Color("TodayColor") : Color("SunColor"))
                    }
                    .padding(.top, -2)
                }
                
                HStack(alignment: .center, spacing: 10) {
                    Image(systemName: "bed.double.fill")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("TodayColor"))
                        .padding(.trailing, 2)
                    
                    Text(String(viewModel.response?.sleepTIme ?? 0))
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
                    
                    Text(String(viewModel.response?.sportsTime ?? 0))
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
                
                
                Spacer(minLength: 100)
            }
            .frame(maxHeight: .infinity)
        }
        .padding(.top, 30)
        .padding(.horizontal, 24)
    }
    
    func countStars(for number: Int) -> Image {
        var offImage: Image?
        
        if number > 0 {
            return offImage ?? Image(systemName: "star.fill")
        } else {
            return Image(systemName: "star.fill")
        }
    }
}


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
