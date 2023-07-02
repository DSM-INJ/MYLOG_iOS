//
//  ContentView.swift
//  MYLOG
//
//  Created by 강인혜 on 28/6/23.
//

import SwiftUI

struct MyPageView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct MyPageView_Previews: PreviewProvider {
    static var previews: some View {
        MyPageView()
    }
}
