//
//  GameModels.swift
//  TicTacToe
//
//  Created by Roberto Pantoja on 18/10/23.
//

import SwiftUI

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

enum GamePiece: String {
    case X, O
    var image: Image {
        Image(self.rawValue)
    }
}

struct Player {
    let gamePiece: GamePiece
    var name: String
    var moves: [Int] = []
    var isCurrent = false
    var isWinner: Bool {
        for moves in Move.winningMoves {
            if moves.allSatisfy(self.moves.contains) {
                return true
            }
        }
        return false
    }
}

enum Move {
    static var all = [1,2,3,4,5,6,7,8,9]

    static var winningMoves = [
        [1,2,3],
        [4,5,6],
        [7,8,9],
        [1,4,7],
        [2,5,8],
        [3,6,9],
        [1,5,9],
        [7,5,3],
    ]
}
