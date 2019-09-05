//
//  Random.swift
//  Taylor
//
//  Created by Julien Ficerai on 05/09/2019.
//  Copyright © 2019 Julien Ficerai. All rights reserved.
//

import Foundation


extension Int
{
    static func random(range: Range<Int> ) -> Int
    {
        var offset = 0

        if range.startIndex < 0   // allow negative ranges
        {
            offset = abs(range.startIndex)
        }

        let mini = UInt32(range.startIndex + offset)
        let maxi = UInt32(range.endIndex   + offset)

        return Int(mini + arc4random_uniform(maxi - mini)) - offset
    }
}
