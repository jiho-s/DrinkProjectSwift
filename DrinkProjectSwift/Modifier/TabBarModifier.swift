//
//  TabBarModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
//    let backgrounColor: Color?
    init() {
        let coloredAppearance = UITabBarAppearance()
        coloredAppearance.backgroundColor = .clear
        
        UITabBar.appearance().backgroundColor = .barColor
        UITabBar.appearance().tintColor = .barColor
        UITabBar.appearance().barTintColor = .barColor
        UITabBar.appearance().unselectedItemTintColor = .lightGray
    }
    func body(content: Content) -> some View {
        content
    }
}
