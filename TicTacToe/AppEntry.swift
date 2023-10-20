//
//  TicTacToeApp.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import SwiftUI

@main
struct AppEntry: App {
    @StateObject var game = GameService()
    
    var body: some Scene {
        WindowGroup {
            StartView().environmentObject(game)
        }
    }
}
