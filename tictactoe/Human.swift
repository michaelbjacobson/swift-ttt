//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

class Human: Player {
    var symbol: String

    init(symbol: String) {
       self.symbol = symbol
    }

    func move() -> Int {
        let input = readLine()
        return Int(input!)!
    }
}
