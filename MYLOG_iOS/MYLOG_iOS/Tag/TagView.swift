//
//  TagView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI

struct TagView: View {
    @StateObject var viewModel: TagViewModel

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
                        .cornerRadius(20, corners: .allCorners)
                        .shadow(color: .black.opacity(0.15), x: 0, y: 4, blur: 15, spread: 0)
                        .frame(height: 65)
                        .padding(.horizontal, 30)
                    Image(systemName: "number")
                        .font(.system(size: 25, weight: .semibold))
                        .foregroundColor(Color("MainColor"))
                        .offset(x: 50)
                    TextField("검색어를 입력하세요.", text: $viewModel.textFieldString) {
                        hideKeyboard()
                    }
                    .font(.system(size: 25, weight: .semibold))
                    .foregroundColor(Color("SubtitleColor"))
                    .offset(x: 90)
                }
                
            }
        }
    }
}

struct TagView_Previews: PreviewProvider {
    static var previews: some View {
        TagView(viewModel: TagViewModel())
    }
}
