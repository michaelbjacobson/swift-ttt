//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

class Board {
    var tiles: [String] = ["1", "2", "3", "4", "5", "6", "7", "8", "9"]
    var winningCombos: [[Int]] = [
        [0, 1, 2], [3, 4, 5], [6, 7, 8],
        [0, 3, 6], [1, 4, 7], [2, 5, 8],
        [0, 4, 8], [2, 4, 6]
    ]

    func format() -> String {
        return """
          \(self.tiles[0]) | \(self.tiles[1]) | \(self.tiles[2])
         ---+---+---
          \(self.tiles[3]) | \(self.tiles[4]) | \(self.tiles[5])
         ---+---+---
          \(self.tiles[6]) | \(self.tiles[7]) | \(self.tiles[8])

         """
    }

    func updateTile(index: Int, symbol: String) {
        self.tiles[index] = symbol
    }

    func resetTile(index: Int) {
        self.tiles[index] = String(index + 1)
    }

    func availableTileIndices() -> [Int] {
        let pattern: String = "[0-9]"
        return self.tiles.indices.filter { self.tiles[$0].matches(pattern) }
    }

    func isFull() -> Bool {
        return availableTileIndices().count == 0
    }

    func isEmpty() -> Bool {
        return availableTileIndices().count == 9
    }

    func corners() -> [Int] {
        return [0, 2, 6, 8]
    }
}
