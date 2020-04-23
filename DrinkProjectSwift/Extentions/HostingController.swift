//
//  UIHostingController.swift
//  DrinkProjectSwift
//
//  Created by 신지호 on 2020/04/23.
//  Copyright © 2020 jiho. All rights reserved.
//

import SwiftUI

class HostingController<Content>: UIHostingController<Content> where Content: View {
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
}
