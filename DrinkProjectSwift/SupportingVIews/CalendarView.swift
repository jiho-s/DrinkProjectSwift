//
//  CalendarView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/27.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
import FSCalendar

struct CalendarView: UIViewRepresentable {
    @Binding var selectedDate: Date
    @Binding var currnetYM: String
    @Binding var showingDateDetail: Bool
    let displayMode: FSCalendarScope
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    init(selectedDate: Binding<Date>, displayMode: FSCalendarScope, currentYM: Binding<String> ,showingDateDetail: Binding<Bool> = .constant(false)) {
        self._selectedDate = selectedDate
        self.displayMode = displayMode
        self._currnetYM = currentYM
        self._showingDateDetail = showingDateDetail
    }
    
    func makeUIView(context: Context) -> FSCalendar {
        let calendar = FSCalendar()
        calendar.delegate = context.coordinator
        calendar.dataSource = context.coordinator
        calendar.scrollDirection = .vertical
        calendar.appearance.weekdayTextColor = .purple
//        calendar.appearance.headerTitleColor = .purple
        calendar.calendarHeaderView.isHidden = true
        calendar.calendarHeaderView.backgroundColor = .clear
        calendar.headerHeight = 0
        calendar.scope = displayMode
        calendar.select(selectedDate)
        return calendar
    }
    func updateUIView(_ uiView: FSCalendar, context: Context) {
    }
    
    
    class Coordinator : NSObject, FSCalendarDelegate, FSCalendarDataSource {
        var parent: CalendarView

        init(_ parent: CalendarView) {
            self.parent = parent
        }
        
        func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.selectedDate = date
            parent.showingDateDetail = true
        }
        
        func calendar(_ calendar: FSCalendar, didDeselect date: Date, at monthPosition: FSCalendarMonthPosition) {
            parent.showingDateDetail = false
        }
        func calendarCurrentPageDidChange(_ calendar: FSCalendar) {
            let value = calendar.currentPage
            let monthFormatter = DateFormatter()
            monthFormatter.dateFormat = "YYYY년 M월"
            parent.currnetYM = monthFormatter.string(from: value)
        }
        
    }
    
}
struct CalendarView_Previews: PreviewProvider {
    static var previews: some View {
        CalendarView(selectedDate: .constant(Date()), displayMode: .month, currentYM: .constant("dd"),showingDateDetail: .constant(false))
    }
}
