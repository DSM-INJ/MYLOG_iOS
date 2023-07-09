//
//  HomeView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI

struct HomeView: View {
    @State var isShowingSheet = true
    var body: some View {
        VStack(alignment: .center) {
            CustomCalendar()
        }
        .sheet(isPresented: $isShowingSheet) {
            HalfSheet {
                Text("hello")
            }
            .shadow(color: .black, x: 0, y: -2, blur: 20, spread: 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
