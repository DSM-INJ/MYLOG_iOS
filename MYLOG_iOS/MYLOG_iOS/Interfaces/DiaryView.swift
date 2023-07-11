import SwiftUI
import Kingfisher

struct DiaryView: View {
    @StateObject var viewModel: HomeViewModel
    @State var starRating = 0
    
    let weatherType: String?
    
    init(
        viewModel: HomeViewModel,
        weatherType: String?
    ) {
        _viewModel = StateObject(wrappedValue: viewModel)
        self.weatherType = weatherType
    }
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .center) {
                HStack(alignment: .center) {
                    VStack {
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
                                .foregroundColor(viewModel.selectedWeather?.rawValue == "SUNNY" ? Color("SunColor") : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 14)
                            
                            ZStack {
                                if viewModel.selectedWeather?.rawValue == "CLOUDY" {
                                    Image("CLOUD")
                                        .resizable()
                                        .frame(width: 43)
                                        .padding(.trailing, 19)
                                }
                                
                                weatherItem(.CLOUDY)
                                    .frame(width: 43)
                                    .foregroundColor(viewModel.selectedWeather?.rawValue == "CLOUDY" ? .clear : Color("ShadowColor").opacity(0.1))
                                    .padding(.trailing, 19)
                            }
                            
                            weatherItem(.RAINY)
                                .frame(width: 30)
                                .foregroundColor(viewModel.selectedWeather?.rawValue == "RAINY" ? Color("RainColor") : Color("ShadowColor").opacity(0.1))
                                .padding(.trailing, 19)
                            
                            weatherItem(.SNOW)
                                .frame(width: 30)
                                .foregroundColor(viewModel.selectedWeather?.rawValue == "SNOW" ? Color("CloudColor") : Color("ShadowColor").opacity(0.1))
                        }
                        .frame(height: 30)
                    }
                    
                    Spacer()
                }
                
                Divider()
                    .background(Color("SeparatorColor"))
                    .padding(.bottom, 20)
                
                KFImage(URL(string: viewModel.imageURL))
                    .placeholder {
                        Image(systemName: "photo.on.rectangle")
                            .aspectRatio(contentMode: .fit)
                    }
                    .resizable()
                    .frame(width: 338, height: 338)
                    .cornerRadius(15, corners: .allCorners)
                    .padding(.bottom, 28)
                
                VStack(alignment: .leading) {
                    Text(viewModel.textFieldString)
                        .foregroundColor(Color("LargeTitleColor"))
                        .font(.system(size: 20, weight: .bold))
                        .padding(.horizontal, 4)
                        .padding(.bottom, 2)
                    
                    Text(viewModel.textEditorString)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("SubtitleColor"))
                        .padding(.horizontal, 4)
                    
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
                        
                        Text("\(viewModel.sleepTime)")
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
                        
                        Text("\(viewModel.sportsTime)")
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
                .padding(.bottom, 82)
                
                Spacer(minLength: 300)
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.top, 30)
        .padding(.horizontal, 24)
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


extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
