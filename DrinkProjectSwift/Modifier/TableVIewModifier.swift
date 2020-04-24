//
//  TableVIewModifier.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/24.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

struct TableVIewModifier: ViewModifier {
        init(){
            UITableView.appearance().backgroundColor = .clear
            UITableViewCell.appearance().backgroundColor = .clear
            UITableView.appearance().separatorColor = .clear
        }
    func body(content: Content) -> some View {
        content
    }
}

