import SwiftUI

struct DiaryView: View {
    @State var isSunny = false
    @State var isCloudy = false
    @State var isRainy = false
    @State var isSnowy = false
    @State var textFieldString = ""
    @State var textEditorString = ""
    
    
    let weatherType: String?

    init(
        weatherType: String?
    ) {
        self.weatherType = weatherType
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
    //                        .padding(.bottom, 9)
                        HStack {
                            Button {
                                switch weatherType.self {
                                case "SUNNY":
                                    isSunny.toggle()
                                default:
                                    print("일치하는 날씨가 없어요")
                                }
                            } label: {
                                Image("SUNNY")
                                    .resizable()
                                    .frame(width: 34)
                            }
                            .padding(.trailing, 14)
                            Button {
                                switch weatherType.self {
                                case "CLOUDY":
                                    isCloudy.toggle()
                                default:
                                    print("일치하는 날씨가 없어요")
                                }
                            } label: {
                                Image("CLOUDY")
                                    .resizable()
                                    .frame(width: 43)
                            }
                            .padding(.trailing, 19)
                            Button {
                                switch weatherType.self {
                                case "RAINY":
                                    isRainy.toggle()
                                default:
                                    print("일치하는 날씨가 없어요")
                                }
                            } label: {
                                Image("RAINY")
                                    .resizable()
                                    .frame(width: 30)
                            }
                            .padding(.trailing, 19)
                            Button {
                                switch weatherType.self {
                                case "SNOW":
                                    isSnowy.toggle()
                                default:
                                    print("일치하는 날씨가 없어요")
                                }
                            } label: {
                                Image("SNOW")
                                    .resizable()
                                    .frame(width: 30)
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
                
                TextField("일기 제목을 입력하세요.", text: $textFieldString) {
                    hideKeyboard()
                }
                .foregroundColor(Color("LargeTitleColor"))
                .font(.system(size: 20, weight: .bold))
                .autocorrectionDisabled()
                .textFieldStyle(PlainTextFieldStyle())
                .padding(.horizontal, 4)
                
                ZStack(alignment: .topLeading) {
                    TextEditor(text: $textEditorString)
                        .padding(.horizontal, 4)
                        .font(.system(size: 17, weight: .regular))
                        .foregroundColor(Color("SubtitleColor"))
                        .autocorrectionDisabled()
                        .multilineTextAlignment(.leading)
                    
                    if textEditorString.isEmpty {
                        Text("일기 내용을 입력하세요.")
                            .foregroundColor(Color("ShadowColor"))
                            .font(.system(size: 17, weight: .regular))
                            .padding(.top, 4)
                            .padding(.horizontal, 6)
                    }
                }
                
                Spacer(minLength: 300)
            }
        }
        .frame(maxHeight: .infinity)
        .padding(.top, 30)
        .padding(.horizontal, 24)
        .onTapGesture {
            hideKeyboard()
        }
    }
}

struct DiaryView_Previews: PreviewProvider {
    static var previews: some View {
        DiaryView(weatherType: "")
    }
}


extension View {
  func hideKeyboard() {
    UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
  }
}
