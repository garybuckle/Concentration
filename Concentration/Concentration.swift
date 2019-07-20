//
//  Concentration.swift
//  Concentration
//
//  Created by Gary Buckle on 20/06/2019.
//  Copyright © 2019 Gary Buckle. All rights reserved.
//

import Foundation

class Concentration  {
    // consider the following instance varts as api
    var cards = [Card]()//array of cards
    var indexOfOneAndOnlyFaceUpCard: Int?
    var flipCount = 0

    
    func chooseCard(at index: Int) {
        // No cards match
        if !cards[index].isMatched {
            // get the index of this card and make sure its  not the currrent card
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                // Check if the cards match
                if cards[matchIndex].identifier == cards[index].identifier {
                    //The identifiers are the same hence a match mark both as matched
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                //flip the chosen card
                cards[index].isFaceUp = true
                // set the indexOfOneAndOnlyFaceUpCard to nil
                indexOfOneAndOnlyFaceUpCard = nil
            } else {
                // Either no cards or twop cards are face up so flip them all down
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                // Turn chosen card up
                cards[index].isFaceUp = true
                //set the indexOfOneAndOnlyFaceUpCard card to this card
                indexOfOneAndOnlyFaceUpCard = index
                
                }
            }
        }
        
    
    
    init(numberOfPairsOfCards: Int) {
        // gets the numbers of pairs of cards and creates pairs by copying the card that was created abd adding the copy to cards array
        for _ in 0..<numberOfPairsOfCards {
            let card = Card()
            cards+=[card,card]
        }
        //TODO: Shuffle the cards
        cards.shuffle()
    }
}           
