//
//  HomeView.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import SwiftUI

struct HomeView: View {
    
    // MARK: - Properties
    
    @State private var guess: RGBModel
    @State private var game = GameModel()
    @State private var showScore: Bool = false
    
    /// fixed constant numbers
    private let circleSize: CGFloat = 0.275
    private let labelHeight: CGFloat = 0.06
    private let labelWidth: CGFloat = 0.53
    private let buttonWidth: CGFloat = 0.87
    
    
    // MARK: - Init
    
    init(guess: RGBModel) {
        self.guess = guess
    }
    
    // MARK: - Body
    
    var body: some View {
        GeometryReader { proxy in
            ZStack {
                
                Color.element
                    .ignoresSafeArea(.all)
                
                VStack {
                    
                    ColorCircle(rgb: game.target,
                                size: proxy.size.height * circleSize)
                    ZStack {
                        !showScore ?
                        BevelText(
                            text: "R: ??? G: ??? B: ???",
                            width: proxy.size.width * labelWidth,
                            height: proxy.size.height * labelHeight) :
                        BevelText(
                            text: game.target.intString(),
                            width: proxy.size.width * labelWidth,
                            height: proxy.size.height * labelHeight)
                    }
                    .padding()
                    
                    ColorCircle(rgb: guess, size: 200)
                    BevelText(text: guess.intString(),
                              width: proxy.size.width * labelWidth,
                              height: proxy.size.height * labelHeight)
                        .padding()
                    
                    
                    ColorSlider(value: $guess.red, trackColor: .red)
                    ColorSlider(value: $guess.green, trackColor: .green)
                    ColorSlider(value: $guess.blue, trackColor: .blue)
                    
                    Button {
                        self.showScore.toggle()
                        self.game.check(guess: guess)
                        
                    } label: {
                        Text("Hit Me!")
                    }
                    .buttonStyle(NeuButtonStyle(width: proxy.size.width * buttonWidth, height: proxy.size.height * labelHeight))
                    
                }
                .font(.system(.headline))
                .alert(isPresented: $showScore) {
                    Alert(
                        title: Text("Your Score"),
                        message: Text(String(game.scoreRound)),
                        dismissButton: .default(Text("Ok")) {
                            game.startNewRound()
                            guess = RGBModel()
                        })
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(guess: RGBModel(red: 0.8, green: 0.3, blue: 0.7))
    }
}
