//
//  SignUpView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/10/26.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

class Account: ObservableObject, Encodable {
    @Published var name = ""
    @Published var email = ""
    @Published var password = ""
    @Published var picture = "123"
    enum CodingKeys: CodingKey {
        case name
        case email
        case password
        case picture
    }
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(name, forKey: .name)
        try container.encode(email, forKey: .email)
        try container.encode(password, forKey: .password)
        try container.encode(picture, forKey: .picture)
        }
}

struct SignUpView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @ObservedObject var account = Account()
    var body: some View {
        ZStack {
            LinearGradient.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("회원가입")
                    .padding()
                    .font(.largeTitle)
                TextField("이메일", text: $account.email)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                Divider()
                TextField("비밀번호", text: $account.password)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                Divider()
                TextField("닉네임", text: $account.name)
                    .keyboardType(.emailAddress)
                    .autocapitalization(.none)
                    .padding()
                Divider()
                Button(action: signUp) {
                    Text("회원가입")
                        .padding()
                        .frame(width: 200, alignment: .center)
                        .accentColor(.white)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }

            }
            .fieldStyle()
        }
    }
    private func signUp() {
        guard let url = URL(string: baseUrl + "/api/account") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        let encode = try? JSONEncoder().encode(account)
        request.httpBody = encode
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 400 {
                showingAlert = true
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

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
