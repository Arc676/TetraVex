//
//  TetraVexKitTests.swift
//  TetraVexKitTests
//
//  Created by Marco Benzi Tobar on 17-06-16.
//  Copyright © 2016 Marco Benzi Tobar. All rights reserved.
//

import XCTest
@testable import TetraVexKit

class TetraVexKitTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPuzzleGeneration() {
        let puzzle = TVPuzzleGenerator(width: 2, height: 2, rangeOfNumbers: 0...9)
        let board = TVBoardModel(width: 2, height: 2)
        
        let a = puzzle.solvedBoard[0][0]
        let b = puzzle.solvedBoard[0][1]
        let c = puzzle.solvedBoard[1][0]
        let d = puzzle.solvedBoard[1][1]
        
        XCTAssert(board.startedPlaying == false)
        XCTAssert(a != b && a != c && a != d && b != c && b != d && c != d)
        
        board.addPieceToBoard(a, x: 0, y: 0)
        var r = board.addPieceToBoard(b, x: 0, y: 1)
        XCTAssert(r == true)
        r = board.addPieceToBoard(c, x: 1, y: 0)
        XCTAssert(r == true)
        r = board.addPieceToBoard(d, x: 1, y: 1)
        XCTAssert(r == true)
        XCTAssert(board.isCompleted())
        XCTAssert(board.startedPlaying == true)
    }
    
    func testPiecePlacement() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        /* A | B
           C | D */
        
        let a = TVPieceModel(top: 1, left: 2, bottom: 3, right: 4)
        let b = TVPieceModel(top: 3, left: 4, bottom: 2, right: 1)
        let c = TVPieceModel(top: 3, left: 1, bottom: 4, right: 2)
        let d = TVPieceModel(top: 2, left: 2, bottom: 1, right: 1)
        
        
        let board = TVBoardModel(width: 2, height: 2)
        var r = board.removePieceFromBoard(a)
        XCTAssert(r == false)
        r = board.addPieceToBoard(a, x: 1, y: 1)
        XCTAssert(r == true)
        r = board.removePieceFromBoard(a)
        XCTAssert(r == true)
        r = board.addPieceToBoard(a, x: 0, y: 1)
        XCTAssert(r == true)
        r = board.addPieceToBoard(b, x: 0, y: 1)
        XCTAssert(r == false)
        r = board.addPieceToBoard(b, x: 1, y: 1)
        XCTAssert(r == true)
        r = board.addPieceToBoard(c, x: 1, y: 0)
        XCTAssert(r == false)
        r = board.addPieceToBoard(d, x: 1, y: 0)
        XCTAssert(r == true)
        XCTAssert(!board.isCompleted())
        r = board.addPieceToBoard(c, x: 0, y: 0)
        XCTAssert(r == true)
        
        XCTAssert(board.isCompleted())
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
