//
//  TicTacVieModelTests.swift
//  tictactoeTests
//
//  Created by Ankit Shrivastava on 28/05/19.
//  Copyright © 2019 Ankit. All rights reserved.
//

import XCTest
@testable import tictactoe

class TicTacVieModelTests: XCTestCase {
    var viewModel : TicTacViewModel!
    
    override func setUp() {
        viewModel = TicTacViewModel(delegate: self)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    func testResetGame(){
        viewModel.resetGame(text: "5")
    }
    
    func testContinueGame(){
        viewModel.boardHandler.resetGame()
        viewModel.continuePlay(row: 0, column: 0)
    }
    
    func testWinner(){
        viewModel.boardHandler.boardManager.currentPlayer = .playerTwo
        viewModel.tictacData[0][0] = TicTac.playerOne
        viewModel.tictacData[0][1] = TicTac.playerOne
        viewModel.tictacData[0][2] = TicTac.playerOne
        viewModel.checkWinner()
    }

    override func tearDown() {
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

extension TicTacVieModelTests: TicTacViewModelDelegate{
    func didResetGame() {
        XCTAssertEqual(viewModel.boardSize, 5,"Board size should be reset")
        XCTAssertEqual(viewModel.tictacData.count, 5,"tictac data should be same")
        XCTAssertEqual(viewModel.boardHandler.getCurrentPlayer(),TicTac.playerOne,"player one should be the first player")
        
        for row in 0..<viewModel.boardSize {
            for column in 0..<viewModel.boardSize {
                XCTAssertEqual(viewModel.tictacData[row][column], .notPlayed,"Tictac board should be cleared, all values should be not played")
            }
        }
    }
    
    func continueGameAt(row: Int, column: Int, validatedMove: Bool) {
        XCTAssertEqual(viewModel.boardHandler.getRecentPlayer(), viewModel.tictacData[0][0],"player and played box value should be same")
    }
    
    func gameDidFinish(winner: TicTac) {
        XCTAssertEqual(winner, TicTac.playerOne)
    }
    
}
