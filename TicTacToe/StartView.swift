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
                        Picker("Select Game", selection:$gameType) {
                            Text("Select Game Type").tag(GameType.undertermined)
                            Text("Share Device").tag(GameType.single)
                            Text("Challenge your device").tag(GameType.bot)
                            Text("Challenge a friend").tag(GameType.peer)
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10, style: .continuous).stroke(lineWidth: 2))
                        Text(gameType.description).padding()
                        VStack {
                            switch gameType {
                            case .single:
                                VStack{
                                    TextField("Your Name", text: $yourName)
                                    TextField("Opponent Name", text: $opponentName)
                                }
                            case .bot:
                                TextField("Your Name", text: $yourName)
                            case .peer:
                                EmptyView()
                            case .undertermined:
                                EmptyView()
                            }
                        }
                        .padding()
                        .textFieldStyle(.roundedBorder)
                        .focused($focus)
                        .frame(width: 350)
                        if gameType != .peer {
                            Button("Start Game") {
                                focus = false
                                startGame.toggle()
                            }.buttonStyle(.borderedProminent)
                                .disabled(gameType == .undertermined ||
                                          gameType == .bot && yourName.isEmpty ||
                                          gameType == .single && (yourName.isEmpty || opponentName.isEmpty)
                                )
                            Image("Home Light")
                        }
                        Spacer()
                    }
                    .padding()
                    .navigationTitle("TicTacToe")
                    .fullScreenCover(isPresented: $startGame) {
                        GameView()
                    }
        }
        
    }
}

#Preview {
    StartView()
}
