//
//  RollableDie.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import Foundation

class RollableDie: ObservableObject, Identifiable {
    var id: String {
        dice.id
    }
    
    let dice: DiceType
    @Published var amount: Int
    @Published var results: [Int] = []
    var total: Int {
        results.reduce(0, +)
    }
    
    init(dice: DiceType) {
        self.dice = dice
        self.amount = 1
    }
    
    func roll() {
        results.removeAll()
        for _ in 1...amount {
            results.append(Int.random(in: 1...dice.value))
        }
    }
}
