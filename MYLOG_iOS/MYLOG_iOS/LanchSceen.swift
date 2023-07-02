//
//  ContentView.swift
//  MYLOG
//
//  Created by 강인혜 on 28/6/23.
//

import SwiftUI

struct LaunchScreenView: View {
    var body: some View {
        ZStack{
            Color("MainColor")
                .ignoresSafeArea()
        VStack {
            Spacer()
            Image("LOGO_MYLOG 1")
                .padding(.horizontal, 85)
            Image("일상을 기록하다, 마이로그")
                .padding()
            Spacer(minLength: 350)
        }
        .padding()}
        
    }
}

struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
