//
//  ContentView.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 06.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var dices = 1
    @State private var defaultSides = 6
    private let sides = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var diceValue = 6
    var body: some View {
        NavigationView {
            VStack {
                Text("Total: \(diceValue)")
                    .font(.largeTitle)
                    
                Text("Previous result: ")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Spacer().frame(height: UIScreen.main.bounds.height * 0.3)
                
//                ForEach(0...dices) {
                    ZStack {
                        Rectangle()
                            .foregroundColor(.red)
                        
                        Text(diceValue.description)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100, height: 100)
//                }
               
                
                Button("Roll dice") {
                    rollDice()
                }
                Spacer()
                
                Form {
                    Stepper("Dices: \(dices)", value: $dices, in: 1...6)
                    
                    Section("Side amount") {
                        
                        Picker("Side", selection: $defaultSides) {
                            ForEach(sides, id: \.self) {
                                Text($0.description)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                }
            }
        }
    }
    
    func rollDice() {
        diceValue = Int.random(in: 1...defaultSides)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
