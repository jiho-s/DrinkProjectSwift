//
//  SettingView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/20.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationView {
            
            Form {
                Section(header: Text("사용자 정보")
                    .font(.headline)
                ) {
                    NavigationLink(destination: Text("ss")){
                        Text("사용자")
                    }
                    NavigationLink(destination: Text("ss")){
                        Text("친구 관리")
                    }
                }
                
                Section(header: Text("기본 설정")
                    .font(.headline)
                ) {
                    ToggleRowView(title: "자동 로그인", isOn: .constant(true))
                    
                }

                Section(header: Text("데이터 관리")
                    .font(.headline)
                ) {
                    NavigationLink(destination: Text("ss")){
                        Text("View")
                    }
                }
                
                Section(header: Text("기타")
                    .font(.headline)
                ) {
                    NavigationLink(destination: Text("ss")){
                        Text("View")
                    }
                }
            .navigationBarTitle("설정")


            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
