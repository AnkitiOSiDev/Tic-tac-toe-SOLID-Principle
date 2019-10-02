//
//  TictacWinnerManagerTests.swift
//  tictactoeTests
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import XCTest
@testable import tictactoe

class TictacWinnerManagerTests: XCTestCase {

    var boardManager : TictacWinnerManager!
    var tictacData = [[TicTac]]()
    let boardSize = 3
    
    override func setUp() {
        boardManager = TictacWinnerManager()
        tictacData = Array(repeating: Array(repeating: TicTac.notPlayed, count: boardSize), count: boardSize)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    func testValidHorizontalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[0][1] = TicTac.playerOne
        tictacData[0][2] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkHorizontal(player:.playerOne , tictacData: tictacData, boardSize: 3),"horizontal should be winner")
    }
    
    func testInValidHorizontalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[0][1] = TicTac.playerOne
        tictacData[0][2] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkHorizontal(player:.playerOne , tictacData: tictacData, boardSize: 3),"horizontal should not be winner")
    }
    
    func testValidVerticalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][0] = TicTac.playerOne
        tictacData[2][0] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkVertical(player:.playerOne , tictacData: tictacData, boardSize: 3),"Vertical should be winner")
    }
    
    func testInValidVerticalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][0] = TicTac.playerOne
        tictacData[2][0] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkVertical(player:.playerOne , tictacData: tictacData, boardSize: 3),"Vertical should not be winner")
    }
    
    func testValidDiagonalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][2] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Diagonal should be winner")
    }
    
    func testInValidDiagonalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][2] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Diagonal should not be winner")
    }
    
    func testValidLTRDiagonal() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][2] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkLTRDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Left to Right should be winner")
    }
    
    func testInValidLTRDiagonalWinner() {
        tictacData[0][0] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][2] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkLTRDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Left to Right should not be winner")
    }
    
    func testValidRTLDiagonal() {
        tictacData[0][2] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][0] = TicTac.playerOne
        
        XCTAssertTrue(boardManager.checkRTLDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Right to Left should be winner")
    }
    
    func testInValidRTLDiagonalWinner() {
        tictacData[0][2] = TicTac.playerOne
        tictacData[1][1] = TicTac.playerOne
        tictacData[2][0] = TicTac.playerTwo
        
        XCTAssertFalse(boardManager.checkRTLDiagonal(player:.playerOne , tictacData: tictacData, boardSize: 3),"Right to Left should not be winner")
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
