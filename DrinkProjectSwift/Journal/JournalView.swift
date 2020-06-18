//
//  JournalView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/27.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
struct JournalView: View {
    @State private var selectedDate = Date()
    @State private var showDateDetail = false
    @State private var navigationTitle = ""
    var body: some View {
        NavigationView {
            ZStack {
                NavigationLink(destination: WeekView(selectedDate: $selectedDate, navigationTitle: $navigationTitle), isActive: $showDateDetail){
                    Text("")
                }
                CalendarView(selectedDate: $selectedDate, displayMode: .month, currentYM: $navigationTitle,showingDateDetail: $showDateDetail)
                    .navigationBarItems(trailing:
                        Button(action: {
                        }){
                            Image(systemName: "plus")
                        }
                        )
                    .navigationBarTitle(Text(navigationTitle), displayMode: .inline)
                    .navigationBarColor(.barColor)
            }.onAppear(perform: getMonth)
        }
    }
    func getMonth() {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "YYYY년 M월"
        navigationTitle = monthFormatter.string(from: selectedDate)
    }
}


struct JournalView_Previews: PreviewProvider {
    static var previews: some View {
        JournalView()
    }
}
