//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

class Game {
    var board: Board = Board()
    var players: [Player] = [Human(symbol: "O"), Computer(symbol: "X")]

    func play() {
        print(self.board.format())
        while !isOver() {
            takeTurn()
        }
        display_game_over_message()
    }

    func takeTurn() {
        self.board.updateTile(index: currentPlayer().move(game: self), symbol: currentPlayer().symbol)
        print(self.board.format())
    }

    func isWonBy(player: Player) -> Bool {
        for combo in self.board.winningCombos {
            if (self.board.tiles[combo[0]] == player.symbol &&
                    self.board.tiles[combo[1]] == player.symbol &&
                    self.board.tiles[combo[2]] == player.symbol) {
                return true
            }
        }
        return false
    }

    func isWon() -> Bool {
        return isWonBy(player: self.players[0]) || isWonBy(player: self.players[1])
    }

    func isTied() -> Bool {
        return self.board.isFull() && !isWon()
    }

    func isOver() -> Bool {
        return isWon() || isTied()
    }

    func currentPlayer() -> Player {
        return self.board.availableTileIndices().count % 2 != 0 ? firstPlayer() : secondPlayer()
    }

    func firstPlayer() -> Player {
        return self.players.first!
    }

    func secondPlayer() -> Player {
        return self.players.last!
    }

    func winner() -> Player {
        return isWonBy(player: firstPlayer()) ? firstPlayer() : secondPlayer()
    }

    func display_game_over_message() {
        if isWon() {
            print("\(winner().symbol) wins!")
        } else {
            print("Tie game!")
        }
    }
}
