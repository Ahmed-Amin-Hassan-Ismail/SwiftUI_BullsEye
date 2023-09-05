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
    
    
    // MARK: - Init
    
    init(guess: RGBModel) {
        self.guess = guess
    }
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            
            Color.element
                .ignoresSafeArea(.all)
            
            VStack {
                
                ColorCircle(rgb: game.target, size: 200)
                ZStack {
                    !showScore ? Text("R: ??? G: ??? B: ???") : Text(game.target.intString())
                }
                .padding()
                
                ColorCircle(rgb: guess, size: 200)
                Text(guess.intString())
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
                .buttonStyle(NeuButtonStyle(width: 327, height: 48))
                
            }
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(guess: RGBModel(red: 0.8, green: 0.3, blue: 0.7))
    }
}
