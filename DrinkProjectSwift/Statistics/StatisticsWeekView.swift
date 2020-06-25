//
//  WeekView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct StatisticsWeekView: View {
    @Binding var navigationTitle: String
    var fetchRequest: FetchRequest<AccountEvent>
    var startOfWeek: Date
    var endOfWeek: Date
    var body: some View {
        Form {
            Section(header: SectionTitle("ㅇㅇ")) {
                Text("dd")
            }
        .tableClear()
        }
        .background(LinearGradient.background)
    }
    
    init(navigationTitle: Binding<String>, filter: Date) {
        self._navigationTitle = navigationTitle
        startOfWeek = filter.startOfWeek!
        endOfWeek = filter.endOfWeek!
        fetchRequest = FetchRequest<AccountEvent>(entity: AccountEvent.entity(), sortDescriptors: [], predicate: NSPredicate(format: "drinkDate >= %@ && drinkDate <= %@ ", startOfWeek as NSDate, endOfWeek as NSDate ))
    }
}

struct StatisticsWeekView_Previews: PreviewProvider {
    static var previews: some View {
        StatisticsWeekView(navigationTitle: .constant("1"), filter: Calendar.current.startOfDay(for: Date()))
    }
}
