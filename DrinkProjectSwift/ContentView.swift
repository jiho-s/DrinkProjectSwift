//
//  ContentView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/20.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Color.barColor
                .edgesIgnoringSafeArea(.all)
            TabView {

                HomeView()
                .tabItem {
                    Image(systemName: "moon.fill")
                    Text("술 추가")
                }
                SettingsView()
                    .tabItem {
                        Image(systemName: "gear")
                        Text("설정")
                    }
            }
            .accentColor(.field)
            .tabBarColor()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
