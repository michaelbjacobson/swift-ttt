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
        waitOneSecond()
        return game.board.isEmpty() ? openingGambit(board: game.board) : miniMax(game: game, depth: 0, scoresDict: [Int: Int]())
    }

    private func openingGambit(board: Board) -> Int {
        return board.corners().sample()
    }

    private func miniMax(game: Game, depth: Int, scoresDict: [Int: Int]) -> Int {
        var scoresDict: [Int: Int] = scoresDict
        if game.isOver() {
            return heuristicValue(game: game)
        } else {
            for index in game.board.availableTileIndices() {
                game.board.updateTile(index: index, symbol: game.currentPlayer().symbol)
                scoresDict.updateValue((-1 * miniMax(game: game, depth: depth + 1, scoresDict: [Int: Int]())), forKey: index)
                game.board.resetTile(index: index)
            }
            return depth == 0 ? bestMove(scoresDict: scoresDict) : bestScore(scoresDict: scoresDict)
        }
    }

    private func bestScore(scoresDict: [Int: Int]) -> Int {
        // TODO: Implement this function properly
        return 0
    }

    private func bestMove(scoresDict: [Int: Int]) -> Int {
        // TODO: Implement this function properly
        return 0
    }

    private func heuristicValue(game: Game) -> Int {
        return game.isWon() ? -1 : 0
    }

    private func waitOneSecond() {
        sleep(1)
    }
}
