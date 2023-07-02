//
//  ContentView.swift
//  MYLOG
//
//  Created by 강인혜 on 1/7/23.
//

import SwiftUI

struct ContentView: View {
    @State var selection: TabFlow = .home
    @State var tabbarHidden = false

    @EnvironmentObject var appState: AppState
    
    var tabItem: [(String, TabFlow)] {
        let tabItems: [(String, TabFlow)] = [
            ("calendar", .home),
            ("magnifyingglass", .tag),
            ("plus", .newDiary),
            ("chart.bar.xaxis", .chart),
            ("person", .myPage)
        ]
        return tabItems
    }
    
    var body: some View {
        ZStack {
            TabView(selection: $selection) {
                HomeView()
                    .tag(TabFlow.home)
                TagView()
                    .tag(TabFlow.tag)
                NewDiaryView()
                    .tag(TabFlow.newDiary)
                ChartView()
                    .tag(TabFlow.chart)
                MyPageView()
                    .tag(TabFlow.myPage)
            }
            .environment(\.tabbarHidden, $tabbarHidden)

            if !tabbarHidden {
                VStack {
                    Spacer()

                    tabbarView()
                        .background {
                            Color("TabBarBackColor")
                                .cornerRadius(15, corners: [.topLeft, .topRight])
                                .ignoresSafeArea()
                        }
                        .shadow()
                        .environment(\.selectionTabbKey, $selection)
                }
            }
        }
        .onChange(of: tabbarHidden) { _ in
            UITabBar.hideTabBar()
        }
        .environment(\.selectionTabbKey, $selection)
    }
    
    @ViewBuilder
    func tabbarView() -> some View {
        HStack {
            Spacer()

            ForEach(tabItem, id: \.1) { name, tag in
                tabItemView(systemName: name, tag: tag)

                Spacer()
            }
        }
    }

    @ViewBuilder
    func tabItemView(systemName: String, tag: TabFlow) -> some View {
        Button {
            withAnimation {
                selection = tag
            }
        } label: {
            VStack(spacing: 7) {
                Image(systemName: systemName)
                    .foregroundColor(tag == selection ? Color("TabBarColor") : Color("SubtitleColor"))
            }
            .padding(.top, 12)
            .padding(.bottom, 4)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
