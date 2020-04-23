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
                    Image(systemName: "star")
                    Text("우우")
                }
                SettingsView()
                    .tabItem {
                        Image(systemName: "star.fill")
                        Text("설정")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
