//
//  FieldModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
struct FieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.field)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
