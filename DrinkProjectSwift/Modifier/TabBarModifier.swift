//
//  TabBarModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct TabBarModifier: ViewModifier {
    init() {
        let coloredAppearance = UITabBar.appearance()
//        coloredAppearance.backgroundColor = .barColor
//        coloredAppearance.tintColor = .barColor
        coloredAppearance.barTintColor = .barColor
        coloredAppearance.unselectedItemTintColor = .gray
    }
    func body(content: Content) -> some View {
        content
    }
}
