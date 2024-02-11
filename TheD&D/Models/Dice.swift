//
//  Dice.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import Foundation
import SwiftUI

enum DiceType: CaseIterable, Identifiable {
    case d2
    case d4
    case d6
    case d8
    case d10
    case d12
    case d20
    case d100
    
    var id: String {
        self.title
    }
    
    var title: String {
        switch self {
        case .d2:
            "D2"
        case .d4:
            "D4"
        case .d6:
            "D6"
        case .d8:
            "D8"
        case .d10:
            "D10"
        case .d12:
            "D12"
        case .d20:
            "D20"
        case .d100:
            "D100"
        }
    }
    
    var value: Int {
        switch self {
        case .d2:
            2
        case .d4:
            4
        case .d6:
            6
        case .d8:
            8
        case .d10:
            10
        case .d12:
            12
        case .d20:
            20
        case .d100:
            100
        }
    }
}
