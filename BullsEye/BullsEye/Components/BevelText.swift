//
//  BevelText.swift
//  BullsEye
//
//  Created by Ahmed Amin on 05/09/2023.
//

import SwiftUI

struct BevelText: View {
    
    // MARK: - Properties
    
    private let text: String
    private let width: CGFloat
    private let height: CGFloat
    
    // MARK: - Init
    
    init(text: String, width: CGFloat, height: CGFloat) {
        self.text = text
        self.width = width
        self.height = height
    }
    
    // MARK: - Body
    
    var body: some View {
        
        Text(text)
            .frame(width: width, height: height)
            .background(
                ZStack {
                    Capsule()
                        .fill(Color.element)
                    .northWestShadow(radius: 3, offset: 1)
                    
                    Capsule()
                        .inset(by: 3)
                        .fill(Color.element)
                    .northWestShadow(radius: 3, offset: 1)
                }
            )
        
    }
}

struct BevelText_Previews: PreviewProvider {
    static var previews: some View {
        BevelText(text: "Show Bevel edge", width: 200, height: 48)
            .padding()
            .previewLayout(.sizeThatFits)
    }
}
