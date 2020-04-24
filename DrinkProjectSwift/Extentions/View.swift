//
//  View.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/22.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

extension View {
    func navigationBarColor(_ backgroundColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor))
    }
    func fieldStyle() -> some View {
        self.modifier(FieldModifier())
    }
    
    func tabBarColor() -> some View {
        self.modifier(TabBarModifier())
    }
    func tableClear() -> some View {
        self.modifier(TableVIewModifier())
    }
}
