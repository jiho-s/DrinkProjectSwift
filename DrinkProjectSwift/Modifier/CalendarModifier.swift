//
//  CalendarModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/28.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
import FSCalendar
struct CalendarModifier: ViewModifier {
    var displayMode: FSCalendarScope
    init(displayMode: FSCalendarScope) {
        self.displayMode = displayMode
        //FSCalendar().scope = displayMode
        FSCalendar().setScope(displayMode, animated: false)
    }
    func body(content: Content) -> some View {
        content
    }
}
