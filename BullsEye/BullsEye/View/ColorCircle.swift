//
//  ColorCircle.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import SwiftUI

struct ColorCircle: View {
    
    // MARK: - Properties
    
    private var rgb: RGBModel
    
    init(rgb: RGBModel) {
        
        self.rgb = rgb
    }
    
    var body: some View {
        
       Circle()
            .fill(Color(rgbStruct: rgb))
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(rgb: RGBModel())
    }
}
