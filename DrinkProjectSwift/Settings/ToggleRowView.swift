//
//  ToggleRowView.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct ToggleRowView: View {
    let title: String
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Toggle(isOn: $isOn) {
                Text(title)
            }
        }
    }
}

struct ToggleRowView_Previews: PreviewProvider {
    static var previews: some View {
        ToggleRowView(title: "ss", isOn: .constant(true))
                .previewLayout(.fixed(width: 300, height: 70))
    }
}

