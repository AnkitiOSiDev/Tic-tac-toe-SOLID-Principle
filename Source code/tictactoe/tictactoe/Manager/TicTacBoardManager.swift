//
//  TicTacBoardManager.swift
//  tictactoe
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation


enum TicTac{
    case playerOne
    case playerTwo
    case notPlayed
    
    var text : String {
        switch self {
        case .playerOne:
            return  "X"
        case .playerTwo:
            return  "O"
        case .notPlayed:
            return ""
        }
    }
}


class TicTacBoardManager {
    var winnerManager : TictacWinnerManager!
    var currentPlayer : TicTac = .playerOne
    var recentPlayer : TicTac {
        get {
            switch currentPlayer {
            case .playerOne:
                return .playerTwo
            case .playerTwo:
                return .playerOne
            case .notPlayed:
                return .notPlayed
            }
        }
    }
    
    init() {
        winnerManager = TictacWinnerManager()
    }
    
    /**
     Method: This method is to check is that block is already filler by user or not
     
     - Parameter tictac: Status for the current box
     - Return : True or false . If user already played return True
     */
    func isPlayed(tictac: TicTac) -> Bool {
        switch tictac {
        case .playerOne,.playerTwo:
            return true
        case .notPlayed:
            return false
        }
    }
    
    /**
     Method: This method is to continue the play and change the chance of current player
     
     - Parameter ticTac: value of the currently filled block in board
     - Return : True or false. Returns true if continue the game
     */
    func continuePlay(ticTac: TicTac) -> Bool {
        if !isPlayed(tictac: ticTac) {
            defer {
                switch currentPlayer {
                case .playerOne:
                    currentPlayer = .playerTwo
                case .playerTwo:
                    currentPlayer = .playerOne
                case .notPlayed:
                    currentPlayer = .notPlayed
                }
            }
            return true
        }
        return false
    }
    
    /**
     Method: This method is to check winner
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    
    func checkWinner(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        return winnerManager.checkWinner(player:player,tictacData:tictacData,boardSize:boardSize)
    }
    
    /**
     Method: This method is to reset the game
     */
    func resetGame() {
        currentPlayer = .playerOne
    }
    
}
