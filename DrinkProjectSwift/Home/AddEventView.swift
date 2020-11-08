//
//  AddEventView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/11/07.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct AddEventView: View {
    let drinks = ["와인", "소주", "맥주", "소맥", "위스키", "샴페인"]
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일"
        return formatter
    }
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var eventRequest: EventRequest
    var body: some View {
        ZStack {
            Color.back2
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("\(eventRequest.drinkDate, formatter: dateFormatter)")
                    .padding()
                    .font(.largeTitle)
                TextField("이벤트 명(옵션)", text: $eventRequest.name)
                    .padding()
                Divider()
                Picker(selection: $eventRequest.item, label: Text("술")) {
                    ForEach(0..<drinks.count) {
                        Text(self.drinks[$0])
                    }
                }
                Divider()
                TextField("잔수", text: $eventRequest.glass)
                    .padding()
                    .keyboardType(.numberPad)
                Divider()
                Button(action: {
                    post()
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Text("저장하기")
                        .padding()
                        .frame(width: 200, alignment: .center)
                        .accentColor(.white)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
                
            }
            .fieldStyle()
            .navigationTitle(Text("이벤트 생성"))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarItems(trailing: Button("취소") {
                //
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
    private func post() {
        guard let url = URL(string: baseUrl + "/api/event") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encode = try? JSONEncoder().encode(eventRequest)
        print(String(decoding: encode!, as: UTF8.self))
        request.httpBody = encode
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 400 {
                return
            }
            if httpResponse.statusCode == 201 {
                presentationMode.wrappedValue.dismiss()
            }
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
                if let decodedResponse = try? JSONDecoder().decode(Token.self, from: data) {
                    token = decodedResponse
                    print(token ?? "d")
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()

    }
}

struct AddEventView_Previews: PreviewProvider {
    static var previews: some View {
        AddEventView(eventRequest: EventRequest())
    }
}
