//
//  RectangularNavigationLink.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct RectangularNavigationLink<Label, Destination>: View  where Label : View, Destination : View{
    let label: () -> Label
    let destination: Destination
    init(destination: Destination, @ViewBuilder label: @escaping () -> Label) {
        self.label = label
        self.destination = destination
    }
    var body: some View {
        NavigationLink(destination: destination, label: label)
            .frame(height: 10)
            .fieldStyle()
    }
}

struct RectangularNavigationLink_Previews: PreviewProvider {
    static var previews: some View {
        RectangularNavigationLink(destination: Text("dd")){
            Text("ee")
        }
    }
}
