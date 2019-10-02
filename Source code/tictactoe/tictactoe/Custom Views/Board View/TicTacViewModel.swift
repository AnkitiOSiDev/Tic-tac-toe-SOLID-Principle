//
//  TicTacViewModel.swift
//  tictactoe
//
//  Created by Ankit on 27/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation


protocol TicTacViewModelDelegate : AnyObject {
    func didResetGame()
    func continueGameAt(row: Int,column: Int,validatedMove : Bool)
    func gameDidFinish(winner: TicTac)
}

class TicTacViewModel {
    weak var delegate : TicTacViewModelDelegate!
    var boardSize = 3
    var tictacData : [[TicTac]] = [[]]
    var boardHandler : TictacBoardHandler!
    
    init(delegate: TicTacViewModelDelegate) {
        self.delegate = delegate
        boardHandler = TictacBoardHandler()
        tictacData = Array(repeating: Array(repeating: .notPlayed, count: boardSize), count: boardSize)
    }
    
    /**
     Method: This method is to check to reset Game
     
     - Parameter text: text is the count of the board
     */
    func resetGame(text:String){
        if let size = Int(text){
            boardSize = size
        } else {
            boardSize = 3
        }
        boardHandler.resetGame()
        tictacData = Array(repeating: Array(repeating: .notPlayed, count: boardSize), count: boardSize)
        delegate.didResetGame()
    }
    
    /**
     Method: This method is to continue the play
     
     - Parameter row: Row of the currently filled block
     - Parameter column: Column of the currently filled block
     - Calls the delegate method to continue the game
     */
    func continuePlay(row: Int, column: Int) {
        let ticTac = tictacData[row][column]
        if boardHandler.continuePlay(ticTac: ticTac){
            tictacData[row][column] = boardHandler.getRecentPlayer()
            delegate.continueGameAt(row: row, column: column,validatedMove: true)
        }else{
            delegate.continueGameAt(row: row, column: column,validatedMove: false)
        }
    }
    
    /**
     Method: This method is to check who is the winner
     - Calls the delegate method to send the winner
     */
    func checkWinner() {
        if boardHandler.checkWinner(player: boardHandler.getRecentPlayer(), tictacData: tictacData, boardSize: boardSize) {
            delegate.gameDidFinish(winner: boardHandler.getRecentPlayer())
        }
    }
    
    
}
