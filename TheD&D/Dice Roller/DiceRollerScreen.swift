//
//  DiceRollerScreen.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import SwiftUI

struct DiceRollerScreen: View {
    @StateObject var viewModel = DiceRollerViewModel()
    
    var body: some View {
        DiceSelectionView(viewModel: viewModel)
    }
}

struct DiceSelectionView: View {
    
    @StateObject var viewModel: DiceRollerViewModel
    
    func isSelected(_ diceType: DiceType) -> Bool {
        viewModel.selections.contains(where: { $0.dice == diceType })
    }
    
    var body: some View {
        HStack {
            ForEach(DiceType.allCases.prefix(4)) { dice in
                Button(action: {
                    viewModel.selected(dice)
                }, label: {
                    Text(dice.title)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                .foregroundStyle(
                    isSelected(dice) ? .red : .blue
                )
            }
        }
        HStack {
            ForEach(DiceType.allCases.suffix(4)) { dice in
                Button(action: {
                    viewModel.selected(dice)
                }, label: {
                    Text(dice.title)
                        .frame(maxWidth: .infinity)
                })
                .buttonStyle(.bordered)
                .foregroundStyle(
                    isSelected(dice) ? .red : .blue
                )
            }
        }
        .padding(.bottom, 16)
        
        ForEach(viewModel.selections) { dice in
            DiceStepperView(model: dice)
        }
    }
}

struct DiceStepperView: View {
    
    @ObservedObject var model: RollableDie
    @State var total: Int = 0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(model.dice.title)")
                .font(.title3.bold())
            Stepper(
                "Dice to roll: \(model.amount)",
                value: $model.amount,
                in: 1...20
            )
            if !model.results.isEmpty {
                Text("Results:")
                HStack {
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 40))],
                              content: {

                        ForEach(model.results) { result in
                            DiceResultView(result: result)
                        }
                    })
                }
                if model.results.count > 1 {
                    Text("Total: \(model.total)")
                }
            }
            
            Button {
                model.roll()
            } label: {
                Text("Roll")
                    .frame(maxWidth: .infinity)
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(.black, lineWidth: 1)
        )
    }
}

struct DiceResultView: View {
    @ObservedObject var result: RollableDie.Result
    
    var body: some View {
        Button {
            result.reroll()
        } label: {
            Text("\(result.number)")
                .font(.caption)
        }
        .buttonStyle(.bordered)
    }
}


#Preview {
    DiceRollerScreen()
}
