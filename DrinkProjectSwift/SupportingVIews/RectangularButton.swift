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
        Button(title){
            self.isOn.toggle()
        }
        .padding()
        .frame(width: 300.0)
        .background(Color.init(red: 237/255, green: 237/255, blue: 237/255))
        .foregroundColor(.black)
        .clipShape(Rectangle())
        .padding(10)
        //.shadow(radius: isOn ? 0 : 5)
    }
    
    
}

struct RectangularButton_Previews: PreviewProvider {
    static var previews: some View {
        RectangularButton(title: "오늘 마신 술 여러 사람으로 나누기", isOn: .constant(true))
    }
}
