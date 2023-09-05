//
//  NeuButtonStyle.swift
//  BullsEye
//
//  Created by Ahmed Amin on 05/09/2023.
//

import SwiftUI

struct NeuButtonStyle:  ButtonStyle {
    
    // MARK: - Properties
    
    private let width: CGFloat
    private let height: CGFloat
    
    
    // MARK: - Init
    
    init(width: CGFloat, height: CGFloat) {
        self.width = width
        self.height = height
    }
    
    
    // MARK: - Body
    
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .foregroundColor(Color.blue)
            .opacity(configuration.isPressed ? 0.2 : 1.0)
            .frame(width: width, height: height)
            .background(
                Group {
                    if configuration.isPressed {
                        Capsule()
                            .fill(Color.element)
                            .southEastShadow()
                    } else {
                        Capsule()
                            .fill(Color.element)
                            .northWestShadow()
                    }
                }
            )
    }
}
