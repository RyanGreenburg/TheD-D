//
//  ContentView.swift
//  TheD&D
//
//  Created by RYAN GREENBURG on 2/10/24.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = DiceRollerViewModel()
    
    var body: some View {
        VStack {
            DiceSelectionView(viewModel: viewModel)

            Spacer()
            
        }
        .padding()
    }
}




#Preview {
    ContentView()
}
