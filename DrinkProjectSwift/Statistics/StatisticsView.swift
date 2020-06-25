//
//  StatisticsView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/27.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct StatisticsView: View {
    @Environment(\.managedObjectContext) var moc
    @State var selectedDate = Calendar.current.startOfDay(for: Date())
    @State private var navigationTitle = "통계"
    @State private var selectedTerm = 0
    let terms = ["주", "월", "년"]
    
    var body: some View {
        NavigationView {
            StatisticsWeekView(navigationTitle: $navigationTitle, filter: selectedDate)
                .navigationBarTitle(navigationTitle)
                .navigationBarItems(trailing: Picker("",selection: $selectedTerm){
                    ForEach(0..<terms.count) {
                        Text(self.terms[$0]).tag($0)
                    }
                }                .pickerStyle(SegmentedPickerStyle())
            )
                .navigationBarColor(.barColor)
        }
    }
}

struct StatisticsView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsView()
    }
}
