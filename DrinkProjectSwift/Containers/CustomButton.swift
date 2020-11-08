//
//  CustomButton.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/11/08.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI
struct CustomButton<Label>: View where Label : View {
    let action: () -> Void
    let label: () -> Label
    public init(action: @escaping () -> Void, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.action = action
    }
    var body: some View {
        Button(action: self.action, label: self.label)
        .frame(width: 300.0, height: 15)
        .foregroundColor(.black)
        .fieldStyle()
        .padding(10)
    }
}

struct CustomButton_Previews: PreviewProvider {
    static var previews: some View {
        CustomButton(action: {}) {
            Text("tdd")
        }
    }
}
