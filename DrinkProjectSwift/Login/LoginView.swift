//
//  LoginView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/10/26.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @State private var username = ""
    @State private var password = ""
    var body: some View {
        ZStack {
            LinearGradient.background
                .edgesIgnoringSafeArea(.all)
            VStack {
                Text("로그인")
                    .padding()
                    .font(.largeTitle)
                TextField("아이디", text: $username)
                    .keyboardType(.emailAddress)

                    .autocapitalization(.none)
                    .padding()
                Divider()
                SecureField("비밀번호", text: $password)
                    .padding()
                    Divider()
                Button(action: login) {
                    Text("로그인")
                        .padding()
                        .frame(width: 200, alignment: .center)
                        .accentColor(.white)
                        .background(Color.gray)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .padding()
                }
                HStack {
                    Text("아직회원이 아니신가요?")
                    Button(action: {}) {
                        Text("회원가입")
                    }
                }
                .padding()
            }
            .fieldStyle()

        }
    }
    private func login() {
        guard let url = URL(string: baseUrl + "/oauth/token" + "?username=" + username + "&password=" + password + "&grant_type=password") else {
            print("Invalid URL")
            return
        }
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        let httpBasic = Data((clientID + ":" + clientSecret).utf8).base64EncodedString()
        print(httpBasic)
        request.setValue("Basic " + httpBasic, forHTTPHeaderField: "Authorization")
        request.httpMethod = "POST"
        URLSession.shared.dataTask(with: request) { (data, response, error) in
//            let urlResponse = response as! HTTPURLResponse
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
                if let decodedResponse = try? JSONDecoder().decode(Token.self, from: data) {
                    token = decodedResponse
//                    DispatchQueue.main.async {
//                        result = decodedResponse
//                    }
                    print(token ?? "d")
                    return
                }
            }

            print("Fetch failed: \(error?.localizedDescription ?? "Unknown error")")
        }.resume()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
