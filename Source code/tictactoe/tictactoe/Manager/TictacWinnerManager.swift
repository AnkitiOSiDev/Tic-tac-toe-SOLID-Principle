//
//  TictacWinnerManager.swift
//  tictactoe
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import Foundation

class TictacWinnerManager {
    
    init() {}
    
    /**
     Method: This method is to check winner
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    
    func checkWinner(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        if checkHorizontal(player: player, tictacData: tictacData, boardSize: boardSize) {
            return true
        } else if checkVertical(player: player, tictacData: tictacData, boardSize: boardSize){
            return true
        } else if checkDiagonal(player: player, tictacData: tictacData, boardSize: boardSize){
            return true
        }
        return false
    }
    /**
     Method: This method is to check horizontal winner
     
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    func checkHorizontal(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        for index in 0..<boardSize {
            let mapCheck = tictacData[index].filter({$0 == player})
            if mapCheck.count == boardSize {
                return true
            }
        }
        return false
    }
    
    /**
     Method: This method is to check vertical winner
     
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    func checkVertical(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        for index in 0..<boardSize {
            let mapCheck = tictacData.filter({$0[index] == player})
            if mapCheck.count == boardSize {
                return true
            }
        }
        return false
    }
    
    /**
     Method: This method is to check diagonal winner
     
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    func checkDiagonal(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        if checkLTRDiagonal(player: player, tictacData: tictacData, boardSize: boardSize) {
            return true
        }else if checkRTLDiagonal(player: player, tictacData: tictacData,boardSize: boardSize) {
            return true
        }
        return false
    }
    
    /**
     Method: This method is to check diagonal winner from left to right
     
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false. If recent played player is winner
     */
    func checkLTRDiagonal(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        for index in 0..<boardSize {
            if tictacData[index][index] != player {
                return false
            }
        }
        return true
    }
    
    /**
     Method: This method is to check diagonal winner from right to left
     
     - Parameter player: recent player played
     - Parameter tictacData: board data for current game
     - Parameter boardSize: Size of the board
     - Return : True or false . If recent played player is winner
     */
    func checkRTLDiagonal(player: TicTac,tictacData: [[TicTac]],boardSize: Int) -> Bool {
        for index in 0..<boardSize {
            if tictacData[index][((boardSize - index) - 1)] != player {
                return false
            }
        }
        return true
    }
}
