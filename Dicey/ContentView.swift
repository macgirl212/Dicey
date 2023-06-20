//
//  ContentView.swift
//  Dicey
//
//  Created by Melody Davis on 6/20/23.
//

import SwiftUI

struct ContentView: View {
    @State private var rawSides = 4
    @State private var rawNumberOfDice = 1
    @State private var rolledNumber = 1
    @State private var hasRolled = false
    @State private var isShowingSettings = false
    @State private var hasChangedSettings = false
    
    var adjustedSides: Int {
        rawSides + 2
    }
    
    var adjustedNumberOfDice: Int {
        rawNumberOfDice + 1
    }
    
    var body: some View {
        NavigationStack {
            HStack {
                Spacer()
                
                Text("\(adjustedSides)-sided")
                    .font(.title)
                
                Spacer()
                
                Text("\(adjustedNumberOfDice) dice")
                    .font(.title)
                
                Spacer()
            }
            Spacer()
            
            if hasRolled {
                VStack {
                    Text("You rolled:")
                        .font(.title)
                    Text("\(rolledNumber)")
                        .font(.largeTitle)
                }
                .opacity(hasChangedSettings ? 0.75 : 1)
                .foregroundColor(hasChangedSettings ? .red : .primary)
                .padding()
            }
            
            Spacer()
            
            Button {
                rollDice()
            } label: {
                Text("Roll Dice")
            }
            
            Spacer()
            
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        isShowingSettings.toggle()
                    } label: {
                        Image(systemName: "gear")
                    }
                }
            }
            .sheet(isPresented: $isShowingSettings) {
                SettingsView(sides: $rawSides, numberOfDice: $rawNumberOfDice, hasChanged: $hasChangedSettings)
            }
        }
    }
    
    func rollDice() {
        rolledNumber = Int.random(in: 1...adjustedSides) * adjustedNumberOfDice
        hasRolled = true
        hasChangedSettings = false
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
