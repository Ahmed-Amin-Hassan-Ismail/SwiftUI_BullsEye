//
//  GameModel.swift
//  BullsEye
//
//  Created by Ahmed Amin on 03/09/2023.
//

import Foundation


struct GameModel {
    let start = RGBModel()
    var target = RGBModel.random()
    var round = 1
    var scoreRound = 0
    var scoreTotal = 0
    
    
    mutating func check(guess: RGBModel) {
      let difference = lround(guess.difference(target: target) * 100.0)
      scoreRound = 100 - difference
      if difference == 0 {
        scoreRound += 100
      } else if difference == 1 { scoreRound += 50 }
      scoreTotal += scoreRound
    }
    
    mutating func startNewRound() {
      round += 1
      scoreRound = 0
      target = RGBModel.random()
    }
    
    mutating func startNewGame() {
      round = 0
      scoreTotal = 0
      startNewRound()
    }
}
