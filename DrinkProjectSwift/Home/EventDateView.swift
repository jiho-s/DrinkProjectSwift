//
//  EventDateView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/11/08.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct EventDateView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var eventRequest: EventRequest
    @State private var showAddEventView = false
    var body: some View {
        NavigationView {
            GeometryReader { geo in
                ZStack {
                    Color.back2
                        .edgesIgnoringSafeArea(.all)
                    NavigationLink(
                        destination: AddEventView(presentationMode: _presentationMode, eventRequest: eventRequest),
                        isActive: $showAddEventView,
                        label: {
                            /*@START_MENU_TOKEN@*/Text("Navigate")/*@END_MENU_TOKEN@*/
                        })
                        .hidden()
                    VStack {
                        Spacer()
                        DatePicker(selection: $eventRequest.drinkDate, in: ...Date(), displayedComponents: .date) {
                            Text("날짜 선택")
                        }
                        Spacer()
                        Button(action: {
                            showAddEventView.toggle()
                        }) {
                            Text("술 추가하기")
                                .padding()
                                .frame(width: 200, alignment: .center)
                                .accentColor(.white)
                                .background(Color.gray)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .padding()
                        }
                    }
                    .frame(height: geo.size.height/2)
                    .fieldStyle()
                }
                .navigationTitle("날짜 선택하기")
                .navigationBarItems(trailing: Button(action: {
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("취소")
                })
                .navigationBarTitleDisplayMode(.inline)
            }
        }
    }
}

struct EventDateView_Previews: PreviewProvider {
    static var previews: some View {
        EventDateView(eventRequest: EventRequest())
    }
}
