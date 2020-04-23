//
//  SectionTitle.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/22.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct SectionTitle: View {
    let title: String
    
    init(_ title: String) {
        self.title = title
    }
    var body: some View {
        Text(title)
            .foregroundColor(.field)
            .font(.headline)
    }
}

struct SectionTitle_Previews: PreviewProvider {
    static var previews: some View {
        SectionTitle("dd")
    }
}
