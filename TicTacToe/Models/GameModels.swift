//
//  GameModels.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import Foundation

enum GameType {
    case single, bot, peer, undertermined
    
    var description: String {
        switch self {
        case .single:
            return "Share your device and play against a friend"
        case .bot:
            return "Play against this device"
        case .peer:
            return "Play against someone who is runing this game near to you"
        case .undertermined:
            return ""
        }
    }
}
