//
//  SettingsView.swift
//  Dicey
//
//  Created by Melody Davis on 6/20/23.
//

import SwiftUI

struct SettingsView: View {
    @Environment(\.dismiss) var dismiss
    @Binding var sides: Int
    @Binding var numberOfDice: Int
    @Binding var hasChanged: Bool
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    Text("Selected sides:")
                    
                    Picker("Enter sides of dice:", selection: $sides) {
                        ForEach(2..<101) {
                            Text("\($0)")
                        }
                    }
                }
                
                HStack {
                    Text("Amount of dice:")
                    
                    Picker("Enter amount of dice:", selection: $numberOfDice) {
                        ForEach(1..<100) {
                            Text("\($0)")
                        }
                    }
                }
                
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        hasChanged = true
                        dismiss()
                    } label: {
                        Text("Reload")
                    }
                }
            }
        }
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView(sides: .constant(4), numberOfDice: .constant(1), hasChanged: .constant(false))
    }
}
