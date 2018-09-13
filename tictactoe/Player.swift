//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

protocol Player {
    var symbol: String {get set}
    func move(game: Game) -> Int
}
