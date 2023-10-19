//
//  GameModels.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import Foundation

enum GameType {
    case single, multi, undertermined
    
    var description: String {
        switch self {
        case .multi:
            return "Share your device and play against a friend"
        case .single:
            return "Play against this device"
        case .undertermined:
            return ""
        }
    }
}
