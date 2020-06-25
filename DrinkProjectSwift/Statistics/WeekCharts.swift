//
//  WeekCharts.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/06/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct WeekCharts: View {
    var fetchRequest: FetchRequest<AccountEvent>
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct WeekCharts_Previews: PreviewProvider {

    static var previews: some View {
        let today = Calendar.current.startOfDay(for: Date())
        let startOfWeek = today.startOfWeek!
        let endOfWeek = today.endOfWeek!
        let fetchRequest = FetchRequest<AccountEvent>(entity: AccountEvent.entity(), sortDescriptors: [], predicate: NSPredicate(format: "drinkDate >= %@ && drinkDate <= %@ ", startOfWeek as NSDate, endOfWeek as NSDate ))
        return WeekCharts(fetchRequest: fetchRequest)
    }
}
