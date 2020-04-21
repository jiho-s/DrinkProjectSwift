//
//  SettingView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/20.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct SettingView: View {
    @State private var autoLogin = false
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("사용자 설정").font(.headline)) {
                    NavigationLink(destination: Text("사용자")){
                        HStack {
                            ProfileImage(name: "noprofile")
                                .frame(width: 44, height: 44)
                            Text("사용자")
                        }
                    }
                }
                
                Section(header: Text("기본 설정")
                    .font(.headline)
                ) {
                        Toggle(isOn: $autoLogin){
                            Text("자동 로그인")
                        }
                }
                Text("hihi")
            }
            .navigationBarTitle("설정")
            
        }
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView()
    }
}
