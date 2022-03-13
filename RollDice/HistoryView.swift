//
//  HistoryView.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 13.03.2022.
//

import SwiftUI

struct HistoryView: View {
    @FetchRequest(sortDescriptors: []) var diceResults: FetchedResults<DiceModel>
    
    var body: some View {
        NavigationView {
            List {
                ForEach(diceResults, id: \.id) { dice in
                    HStack {
                        HStack {
                            Image(systemName: "clock")
                        }
                        
                        Text(dice.value.description)
                    }
                }
            }
        }.navigationTitle("Roll Dice").navigationViewStyle(.stack)
    }
}

struct HistoryView_Previews: PreviewProvider {
    static var previews: some View {
        HistoryView()
    }
}
