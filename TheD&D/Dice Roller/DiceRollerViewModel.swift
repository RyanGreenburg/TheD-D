//
//  DiceRollerViewModel.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import Foundation

class DiceRollerViewModel: ObservableObject {
    @Published var selections: [RollableDie] = []
    
    func selected(_ diceType: DiceType) {
        if let index = selections.firstIndex(where: {$0.dice == diceType }) {
            selections.remove(at: index)
        } else {
            selections.append(
                RollableDie(
                    dice: diceType
                )
            )
        }
    }
}
