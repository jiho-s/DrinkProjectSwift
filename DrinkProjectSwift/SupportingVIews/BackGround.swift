//
//  BackGround.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/22.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct BackGround: View {
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.back1, .bakc2]), startPoint: .topTrailing, endPoint: .bottomLeading)
    }
}

struct BackGround_Previews: PreviewProvider {
    static var previews: some View {
        BackGround()
    }
}
