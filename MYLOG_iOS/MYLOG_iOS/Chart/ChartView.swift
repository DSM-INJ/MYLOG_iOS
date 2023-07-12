//
//  ChartView.swift
//  MYLOG_iOS
//
//  Created by 강인혜 on 2/7/23.
//

import SwiftUI
import Charts

struct ChartView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(alignment: .leading) {
                Text("지난주 나의 생활 분석")
                    .font(.system(size: 30, weight: .bold))
                    .foregroundColor(Color("TitleColor"))
                    .padding(.top, 42)
                
                Image("Chart 5")
                    .resizable()
                    .frame(height: 370)
                
                Image("Chart 3")
                    .resizable()
                    .frame(height: 370)
            }
            .padding(.horizontal, 26)
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}
