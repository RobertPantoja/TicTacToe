//
//  GameView.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import SwiftUI

struct GameView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("End Game") {
                        dismiss()
                    }.buttonStyle(.bordered)
                }
            }
            .navigationTitle("TicTacToe")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    GameView()
}
