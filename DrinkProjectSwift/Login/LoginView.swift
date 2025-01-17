//
//  LoginView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/10/26.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct LoginView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showingAlert = false
    @State private var showingSignUp = false
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
                .alert(isPresented: $showingAlert){
                    Alert(title: Text("로그인 실패"), message: Text("아이디 또는 비밀번호가 일치하지 않습니다."), dismissButton: .cancel(Text("취소")))
                }
                HStack {
                    Text("아직회원이 아니신가요?")
                    Button(action: {
                        showingSignUp = true
                    }) {
                        Text("회원가입")
                    }
                    .sheet(isPresented: $showingSignUp) {
                        SignUpView()
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
            let httpResponse = response as! HTTPURLResponse
            if httpResponse.statusCode == 400 {
                showingAlert = true
                return
            }
//            let urlResponse = response as! HTTPURLResponse
            if let data = data, let dataString = String(data: data, encoding: .utf8) {
                print(dataString)
                if let decodedResponse = try? JSONDecoder().decode(Token.self, from: data) {
                    token = decodedResponse
                    if let encoded = try? JSONEncoder().encode(token) {
                        UserDefaults.standard.set(encoded, forKey: "token")
                    }
                    presentationMode.wrappedValue.dismiss()
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
