//
// Created by Michael Jacobson on 12/09/2018.
// Copyright (c) 2018 michaeljacobson. All rights reserved.
//

import Foundation

extension String {
    func matches(_ regex: String) -> Bool {
        return self.range(of: regex, options: .regularExpression, range: nil, locale: nil) != nil
    }
}
