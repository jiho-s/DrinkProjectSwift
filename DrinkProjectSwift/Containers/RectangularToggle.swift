//
//  RectangularToggle.swift
//  DrinkProjectSwift
//
//  Cr/Users/jiho/Documents/Coding/Swift/DrinkProjectSwift/DrinkProjectSwift/Containers/RectangularToggle.swifteated by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct RectangularToggle<Label>: View where Label : View{
    let label: () -> Label
    var isOn: Binding<Bool>
    init(isOn: Binding<Bool>, @ViewBuilder label: @escaping () -> Label) {
        self.isOn = isOn
        self.label = label
    }
    var body: some View {
        Toggle(isOn: isOn, label: label)
            .frame(height: 10)
            .fieldStyle()
    }
}

struct RectangularToggle_Previews: PreviewProvider {
    static var previews: some View {
        RectangularToggle(isOn: .constant(true)) {
            Text("dd")
        }
    }
}
