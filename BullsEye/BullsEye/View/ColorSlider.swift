//
//  ColorSlider.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import SwiftUI

struct ColorSlider: View {
    
    @Binding var value: Double
    var trackColor: Color
    
    var body: some View {
        HStack {
            Text("0")
            Slider(value: $value)
                .accentColor(trackColor)
            Text("255")
        }
        .padding()
    }
}

struct ColorSlider_Previews: PreviewProvider {
    static var previews: some View {
        ColorSlider(value: .constant(0.5), trackColor: .red)
    }
}
