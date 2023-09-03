//
//  BullsEyeApp.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import SwiftUI

@main
struct BullsEyeApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView(guess: RGBModel())
        }
    }
}
