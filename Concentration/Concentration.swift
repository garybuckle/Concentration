//
//  Concentration.swift
//  Concentration
//
//  Created by Gary Buckle on 20/06/2019.
//  Copyright © 2019 Gary Buckle. All rights reserved.
//

import Foundation

class Concentration  {
    
    var cards = [Card]()
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0
    
    func chooseCard(at Index: Int) {
        if cards[Index].isMatched {
            // already matched do nothing
            return
        }
        // incremant flipcount
        flipCount+=1
        // If we have a card facing up already, check if it matches the chosen one
        if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex !=index {
            
        }
        }
        
    
    
    init(numberOfPairsOfCards: Int) {
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards+=[card,card]
        }
        //TODO: Shuffle the cards
    }
}
