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
                Section(header: SectionTitle("사용자 정보")) {
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("사용자")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("친구 관리")
                    }
                }


                Section(header: SectionTitle("기본 설정")) {
                    RectangularToggle(isOn: .constant(true)){
                        Text("자동로그인")
                    }
                    RectangularToggle(isOn: .constant(true)){
                        Text("알림")
                    }
                }

                Section(header: SectionTitle("데이터 관리")) {
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("사용자 음주량 추가")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("사용자 음주량 제거")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("술 표시 순서 변경")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("사용자 술 추가")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("단위 선택")
                    }
                }

                Section(header: SectionTitle("기타")) {
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("도움말")
                    }
                    RectangularNavigationLink(destination: Text("ss")){
                        Text("회원탈퇴")
                    }

                }
            }
            .background(LinearGradient.background)
            .navigationBarTitle(Text("설정"), displayMode: .automatic)
            //.navigationBarColor(.barColor)
        }
    }
    init(){
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
