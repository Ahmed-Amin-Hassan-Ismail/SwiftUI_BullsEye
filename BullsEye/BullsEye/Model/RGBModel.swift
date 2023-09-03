//
//  RGBModel.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import Foundation



struct RGBModel {
    var red = 0.5
    var green = 0.5
    var blue = 0.5
    
    
    static func random() -> Self {
        var rgb = RGBModel()
        rgb.red = Double.random(in: 0..<1)
        rgb.green = Double.random(in: 0..<1)
        rgb.blue = Double.random(in: 0..<1)
        
        return rgb
    }
    
    func difference(target: Self) -> Double {
      let rDiff = red - target.red
      let gDiff = green - target.green
      let bDiff = blue - target.blue
      return sqrt(
        (rDiff * rDiff + gDiff * gDiff + bDiff * bDiff) / 3.0)
    }
    
    func intString() -> String {
      "R: \(Int(red * 255.0))"
        + "  G: \(Int(green * 255.0))"
        + "  B: \(Int(blue * 255.0))"
    }
}
