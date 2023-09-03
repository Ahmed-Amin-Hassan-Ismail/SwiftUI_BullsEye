//
//  Color + EXT.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import SwiftUI


extension Color {
    
    init(rgbStruct rgb: RGBModel) {
      self.init(red: rgb.red, green: rgb.green, blue: rgb.blue)
    }
    
}
