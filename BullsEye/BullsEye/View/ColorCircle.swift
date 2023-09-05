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
    private var size: CGFloat
    
    init(rgb: RGBModel, size: CGFloat) {
        
        self.rgb = rgb
        self.size = size
    }
    
    var body: some View {
        
        ZStack {
            
            Circle()
                .fill(Color.element)
                .northWestShadow()
            
            Circle()
            .fill(Color(rgbStruct: rgb))
            .padding()            
        }
        .frame(width: size, height: size)
    }
}

struct ColorCircle_Previews: PreviewProvider {
    static var previews: some View {
        ColorCircle(rgb: RGBModel(), size: 200)
    }
}
