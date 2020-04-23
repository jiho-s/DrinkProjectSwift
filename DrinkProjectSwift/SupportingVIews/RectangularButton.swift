//
//  RectangularButtun.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/21.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct RectangularButton: View {
    let title: String
    @Binding var isOn: Bool
    var body: some View {
        Button(action: {
            self.isOn.toggle()
            
        }){
            Text(title)
                .font(.headline)
        }
        .frame(width: 300.0)
        .foregroundColor(.black)
        .fieldStyle()
        .padding(10)
        //.shadow(radius: isOn ? 0 : 5)
    }
    
    
}

struct RectangularButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangularButton(title: "오늘 마신 술 여러 사람으로 나누기", isOn: .constant(true))
    }
}
