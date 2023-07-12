//
//  HomeView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI
import SlideOverCard

struct HomeView: View {
    @StateObject var viewModel: HomeViewModel
    @State private var position = CardPosition.middle
    @State private var background = BackgroundStyle.solid
    
    var body: some View {
        ZStack(alignment: .center) {
            CustomCalendar(viewModel: viewModel)
            
            SlideOverCard($position, backgroundStyle: $background) {
                DiaryView(viewModel: viewModel)
                    .onChange(of: viewModel.selectedDate) { _ in
                        viewModel.response = nil
                        viewModel.onAppear()
                    }
            }
            .shadow(color: .black.opacity(0.1), x: 0, y: -2, blur: 20, spread: 0)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: HomeViewModel())
    }
}
