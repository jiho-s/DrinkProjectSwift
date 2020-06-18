//
//  WeekView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/27.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct WeekView: View {
    @Binding var selectedDate: Date
    @Binding var navigationTitle: String
    var body: some View {
        VStack{
            CalendarView(selectedDate: $selectedDate, displayMode: .week, currentYM: $navigationTitle)
            Form{
                Section {
                    Text("블라블라")
                    Text("블라블라")
                    Text("블라블라")
                    Text("블라블라")
                }
            }
            Spacer()
        }
        .navigationBarTitle(Text(""), displayMode: .inline)
        .navigationBarColor(.barColor)
    }
}

struct WeekView_Previews: PreviewProvider {
    static var previews: some View {
        WeekView(selectedDate: .constant(Date()), navigationTitle: .constant("2020년 4월"))
    }
}
