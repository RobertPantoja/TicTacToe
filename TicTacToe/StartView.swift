//
//  ContentView.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import SwiftUI

struct StartView: View {
    @State private var gameType: GameType = .undertermined
    @State private var yourName = ""
    @State private var opponentName = ""
    @FocusState private var focus: Bool
    @State private var startGame = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                
                Image("Home Light").resizable().scaledToFit().frame(maxWidth: 192)
                
                Spacer()
                
                Picker("Select Game", selection:$gameType) {
                    Text("Select Game Type").tag(GameType.undertermined)
                    Text("Single-player").tag(GameType.single)
                    Text("Multi-player").tag(GameType.multi)
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .stroke(lineWidth: 2))
                
                Text(gameType.description).padding()
                
                VStack {
                    switch gameType {
                    case .single:
                        TextField("Your Name", text: $yourName)
                    case .multi:
                        VStack{
                            TextField("Player 1", text: $yourName)
                            TextField("Player 2", text: $opponentName)
                        }
                    case .undertermined:
                        EmptyView()
                    }
                }
                .padding()
                .textFieldStyle(.roundedBorder)
                .focused($focus).frame(width: 350)
                
                Button("Start Game") {
                    focus = false
                    startGame.toggle()
                }
                .buttonStyle(.borderedProminent).disabled(
                    gameType == .undertermined ||
                    gameType == .single && yourName.isEmpty ||
                    gameType == .multi && (yourName.isEmpty || opponentName.isEmpty)
                )
                    
            }.padding().fullScreenCover(isPresented: $startGame) {
                GameView()
            }
        }
    }
}

#Preview {
    StartView()
}
