//
//  BoardHandler.swift
//  tictactoe
//
//  Created by Ankit Shrivastava on 29/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation


class TictacBoardHandler {
    
    let boardManager : TicTacBoardManager
    let winnerManager : TictacWinnerManager
    
    init() {
        boardManager = TicTacBoardManager()
        winnerManager = TictacWinnerManager()
    }
    
    /**
     Method: This method is to check is that block is already filler by user or not
     
     - Parameter tictac: Status for the current box
     - Return : True or false . If user already played return True
     */
    func isPlayed(tictac: TicTac) -> Bool {
        return boardManager.isPlayed(tictac:tictac)
    }
    
    /**
     Method: This method is to continue the play and change the chance of current player
     
     - Parameter ticTac: value of the currently filled block in board
     - Return : True or false. Returns true if continue the game
     */
    func continuePlay(ticTac: TicTac) -> Bool {
        return boardManager.continuePlay(ticTac:ticTac)
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
        boardManager.resetGame()
    }
    
    /**
     Method: This method is to fetch recent player
     - Return : Returns recent player who played recentlty.
     */
    func getRecentPlayer() -> TicTac {
       return boardManager.recentPlayer
    }
    
    /**
     Method: This method is to fetch current player
     - Return : Returns recent player.
     */
    func getCurrentPlayer() -> TicTac {
        return boardManager.currentPlayer
    }
}
