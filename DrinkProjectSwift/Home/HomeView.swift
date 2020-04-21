//
//  HomeView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    @State private var showingTodaySheet = false
    @State private var showingManyTodaySheet = false
    @State private var showingPastSheet = false
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color(red: 100/255, green: 88/255, blue: 149/255), Color(red: 214/255, green: 130/255, blue: 148/255)]), startPoint: .topTrailing, endPoint: .bottomLeading)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Image("default")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(100)
                RectangularButton(title: "오늘 마신 술 잔으로 추가하기", isOn: self.$showingTodaySheet)
                .sheet(isPresented: $showingTodaySheet){
                    Text("dd")
                }
                RectangularButton(title: "오늘 마신 술 여러 사람으로 나누기", isOn: self.$showingManyTodaySheet)
                .sheet(isPresented: $showingManyTodaySheet){
                    Text("dd")
                }
                RectangularButton(title: "과거에 마신 술 추가하기", isOn: self.$showingPastSheet)
                .sheet(isPresented: $showingPastSheet){
                    Text("ee")
                }
            }
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
