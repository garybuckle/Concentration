//
//  Card.swift
//  Concentration
//
//  Created by Gary Buckle on 20/06/2019.
//  Copyright © 2019 Gary Buckle. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
        //increment the identifier
        identifierFactory += 1
        //return it to the calling card
        return Card.identifierFactory
    }
    
    init() {
        //using static func
        self.identifier = Card.getUniqueIdentifier()
    }
    
}
