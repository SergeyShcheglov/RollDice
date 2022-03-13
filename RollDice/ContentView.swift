//
//  ContentView.swift
//  RollDice
//
//  Created by Sergey Shcheglov on 06.03.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var dices = 1
    @State private var diceAmount = Array(0...6)

    @State private var defaultSides = 6
    private let sides = [4, 6, 8, 10, 12, 20, 100]
    
    @State private var previousResult = 0
    @State private var totalResult = 0
    
    @State private var diceDict: [String: Int] = ["1Dice": 6]
    
    @State private var feedback = UINotificationFeedbackGenerator()
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Total: \(totalResult)")
                    .font(.largeTitle)
                    
                Text("Previous result: \(previousResult)")
                    .font(.title3)
                    .foregroundColor(.secondary)
                Spacer().frame(height: UIScreen.main.bounds.height * 0.3)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(diceDict.values.sorted(), id:\.self) { dice in
                            ZStack {
                                RoundedRectangle(cornerRadius: 25)
                                    .foregroundColor(Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1)))
                                    
                                
                                Text(String(dice))
                                    .font(.largeTitle)
                                    .foregroundColor(.white)
                            }
                            .frame(width: 100, height: 100)
                        }
                    }
                }
                Button {
                    withAnimation {
                        rollDice()
                        feedback
                            .notificationOccurred(.success)
                    }
                } label: {
                    Text("Roll dice")
                        .font(.title2)
                        .padding().frame(height: 50)
                }
                Spacer()
                
                Form {
                    Stepper("Dices: \(dices)", value: $dices, in: 1...6) { dice in
                        changeDicesAmount(diceKey: "\(dices)Dice", diceValue: Int.random(in: 1...6))
                        feedback.prepare()
                    }
                    
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
        for (key, _) in diceDict {
            diceDict[key] = Int.random(in: 1...defaultSides)
        }
        sumTotal()
    }
    
    func createNewDice(diceKey: String, diceValue: Int) {
        diceDict[diceKey] = diceValue
        print(diceDict)
    }
    
    func changeDicesAmount(diceKey: String, diceValue: Int) {
        if dices > diceDict.count {
            diceDict[diceKey] = diceValue
        } else if dices < diceDict.values.count {
            let diceRandom = diceDict.randomElement()?.key
            diceDict.removeValue(forKey: diceRandom!)
        }
        print(dices)
        print(diceDict.description)
    }
    
    func sumTotal() {
        var result: Int {
            var total = 0
        for (key, _) in diceDict {
            total += diceDict[key]!
        }
            return total
    }
        previousResult = totalResult
        totalResult = result
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
