//
//  RollableDie.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import Foundation
import Combine

class RollableDie: ObservableObject, Identifiable {
    class Result: ObservableObject, Identifiable {
        let dice: DiceType
        @Published var number: Int
        let id = UUID()
        
        init(dice: DiceType, number: Int) {
            self.dice = dice
            self.number = number
        }
        
        func reroll() {
            number = Int.random(in: 1...dice.value)
        }
    }
    
    var id: String {
        dice.id
    }
    
    let dice: DiceType
    @Published var amount: Int
    @Published var results: [Result] = []
    var cancellables: Set<AnyCancellable> = []
    @Published var total: Int = 0
    
    init(dice: DiceType) {
        self.dice = dice
        self.amount = 1
    }
    
    func roll() {
        results.removeAll()
        for _ in 1...amount {
            let result = Result(dice: dice, number: Int.random(in: 1...dice.value))
            results.append(result)
            result.$number.didSet.sink { [weak self] _ in
                self?.calculateTotal()
            }.store(in: &cancellables)
        }
    }
    
    func calculateTotal() {
        total = results.map { $0.number }.reduce(0, +)
    }
}
