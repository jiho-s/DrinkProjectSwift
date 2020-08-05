//
//  WeekView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/27.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct DayView: View {
    @Binding var selectedDate: Date
    @State private var navigationTitle: String = ""
    var body: some View {
        VStack{
            Form{
                Section(header: SectionTitle("이벤트 목록")) {
                    RectangularNavigationLink(destination: Text("ttt")){
                        Text("이벤트 1")
                    }
                    RectangularNavigationLink(destination: Text("ttt")){
                        Text("이벤트 2")
                    }
                    RectangularNavigationLink(destination: Text("ttt")){
                        Text("이벤트 3")
                    }
                }
            }
        .tableClear()
        }
        .onAppear(perform: getTitle)
        .navigationBarTitle(Text(navigationTitle), displayMode: .inline)
        .background(LinearGradient.background)
        .navigationBarColor(.barColor)
    }
    func getTitle( ) {
        let monthFormatter = DateFormatter()
        monthFormatter.dateFormat = "d일"
        navigationTitle = monthFormatter.string(from: selectedDate)
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView(selectedDate: .constant(Date()))
    }
}
