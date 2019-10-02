//
//  tictactoeTests.swift
//  tictactoeTests
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import XCTest
@testable import tictactoe

class TicTacBoardManagerTests: XCTestCase {

    var boardManager : TicTacBoardManager!
    var tictacData = [[TicTac]]()
    let boardSize = 3
        
    override func setUp() {
        boardManager = TicTacBoardManager()
        tictacData = Array(repeating: Array(repeating: TicTac.notPlayed, count: boardSize), count: boardSize)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testValidisPlayed(){
        tictacData[1][0] = TicTac.playerTwo
        XCTAssertTrue(boardManager.isPlayed(tictac: tictacData[1][0]),"box should be played")
    }
    
    func testInValidisPlayed(){
        XCTAssertFalse(boardManager.isPlayed(tictac: tictacData[2][0]),"box should not be played")
    }
    
    func testValidvalidMove(){
        tictacData[1][0] = TicTac.notPlayed
        XCTAssertTrue(boardManager.continuePlay(ticTac: tictacData[1][0]),"Game should be continue")
    }
    
    func testInValidvalidMove(){
        tictacData[1][0] = TicTac.playerTwo
        XCTAssertFalse(boardManager.continuePlay(ticTac: tictacData[1][0]),"Game should not be continue")
    }
    
    func testValidCheckWinner(){
        tictacData[0][0] = TicTac.playerOne
        tictacData[0][1] = TicTac.playerOne
        tictacData[0][2] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkWinner(player:.playerOne , tictacData: tictacData, boardSize: 3),"player should be winner")
    }
    
    func testInValidCheckWinner(){
        tictacData[0][0] = TicTac.playerOne
        tictacData[0][1] = TicTac.playerOne
        tictacData[0][2] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkWinner(player:.playerOne , tictacData: tictacData, boardSize: 3),"player should not be winner")
    }
    
    func testResetGame(){
        boardManager.currentPlayer = .playerTwo
        boardManager.resetGame()
        XCTAssertEqual(boardManager.currentPlayer,TicTac.playerOne,"player one should be the first player")
    }
    override func tearDown() {
        tictacData.removeAll()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
