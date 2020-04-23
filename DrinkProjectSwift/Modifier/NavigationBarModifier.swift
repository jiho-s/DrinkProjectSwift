//
//  NavigationBarModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/22.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    
    init( backgroundColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = .clear
        coloredAppearance.titleTextAttributes = [.foregroundColor: UIColor.field]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: UIColor.field]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = .field
    }

    func body(content: Content) -> some View {
        ZStack{
//            Color(self.backgroundColor ?? .clear)
//                .edgesIgnoringSafeArea(.top)
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
//    func body(content: Content) -> some View {
//        content
//    }
}

