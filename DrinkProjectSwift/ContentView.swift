//
//  ContentView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/20.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var showLoginView = false
    var body: some View {
        TabView {
            HomeView()
            .tabItem {
                Image(systemName: "moon.fill")
                Text("술 추가")
            }
            JournalView()
                .tabItem {
                    Image(systemName: "calendar")
                    Text("일지")
            }
            StatisticsView()
                .tabItem {
                    Image(systemName: "note.text")
                    Text("통계")
            }
            SettingsView()
                .tabItem {
                    Image(systemName: "gear")
                    Text("설정")
            }
        }
        .fullScreenCover(isPresented: $showLoginView) {
            LoginView()
        }
        .onAppear(perform: checkLogin)
        .accentColor(.field)
        .tabBarColor()
    }
    func checkLogin() {
        if token == nil {
            showLoginView = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
