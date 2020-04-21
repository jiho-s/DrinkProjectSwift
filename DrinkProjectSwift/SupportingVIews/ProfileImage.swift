//
//  ProfileImage.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/20.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct ProfileImage: View {
    let name: String
    var body: some View {
        Image(name)
            .resizable()
            .scaledToFit()
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
    }
}

struct ProfileImage_Previews: PreviewProvider {
    static var previews: some View {
        ProfileImage(name: "noprofile")
    }
}
