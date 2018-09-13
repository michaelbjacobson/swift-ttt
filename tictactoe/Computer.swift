//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

class Computer: Player {
    var symbol: String

    init(symbol: String) {
        self.symbol = symbol
    }

    func move(game: Game) -> Int {
//        waitOneSecond()
        if game.board.isEmpty() {
            return openingGambit(board: game.board)
        } else {
            return miniMax(game: game, depth: 0, scoresDict: [Int: Int]())
        }
    }

    private func openingGambit(board: Board) -> Int {
        return board.corners().sample()
    }

    private func miniMax(game: Game, depth: Int, scoresDict: [Int: Int]) -> Int {
        var scoresDict = scoresDict
        if game.isOver() {
            return heuristicValue(game: game)
        } else {
            for index in game.board.availableTileIndices() {
                game.board.updateTile(index: index, symbol: game.currentPlayer().symbol)
                scoresDict.updateValue((-1 * miniMax(game: game, depth: depth + 1, scoresDict: [Int: Int]())), forKey: index)
                game.board.resetTile(index: index)
            }
            if depth == 0 {
                return bestMove(scoresDict: scoresDict)
            } else {
                return bestScore(scoresDict: scoresDict)
            }
        }
    }

    private func bestMove(scoresDict: [Int: Int]) -> Int {
        return scoresDict.max { a, b in a.value < b.value }!.key
    }

    private func bestScore(scoresDict: [Int: Int]) -> Int {
        return scoresDict.max { a, b in a.value < b.value }!.value
    }

    private func heuristicValue(game: Game) -> Int {
        if game.isWon() {
            return -1
        } else {
            return 0
        }
    }

    private func waitOneSecond() {
        sleep(1)
    }
}
