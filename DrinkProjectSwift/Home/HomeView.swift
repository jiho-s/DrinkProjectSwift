//
//  HomeView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
class EventRequest:ObservableObject, Encodable {
    @Published var glass = "" {
        didSet {
            let filtered = glass.filter { $0.isNumber }
            if glass != filtered {
                glass = filtered
            }
        }
    }
    @Published var item = 0
    @Published var name = ""
    @Published var drinkDate = Date()
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        return formatter
    }
    enum CodingKeys: CodingKey {
        case glass
        case item
        case name
        case drinkDate
    }
    func encode(to encoder: Encoder) throws {
        let stringDate = dateFormatter.string(from: drinkDate)
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(Int(glass) , forKey: .glass)
        try container.encode(name, forKey: .name)
        try container.encode(item, forKey: .item)
        try container.encode(stringDate, forKey: .drinkDate)
        }

}

struct HomeView: View {
    @State private var showingTodaySheet = false
    @State private var showingManyTodaySheet = false
    @State private var showingPastSheet = false
    @ObservedObject var eventRequest = EventRequest()
    var body: some View {
        ZStack {
            LinearGradient.background
            VStack {
                Image("wine")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 150, height: 150)
                    .padding(70)
                CustomButton(action: {
                    eventRequest.drinkDate = Date()
                    self.showingTodaySheet.toggle()
                }) {
                    Text("오늘 마신 술 잔으로 추가하기")
                }
                .sheet(isPresented: $showingTodaySheet){
                    NavigationView {
                        AddEventView(eventRequest: eventRequest)
                    }
                }
                RectangularButton(title: "과거에 마신 술 추가하기", isOn: self.$showingPastSheet)
                .sheet(isPresented: $showingPastSheet){
                    EventDateView(eventRequest: eventRequest)
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
