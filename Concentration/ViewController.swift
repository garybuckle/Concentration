//
//  ViewController.swift
//  Concentration
//
//  Created by Gary Buckle on 19/06/2019.
//  Copyright © 2019 Gary Buckle. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    // create an instance and init with the number of cards according to the amount of buttons. lazy makes it available prior to usage.
    lazy var game =  Concentration(numberOfPairsOfCards: cardButtons.count + 1 / 2)
    
    var flipCount = 0 {
        didSet {
            flipCountLabel.text = "Flips: \(flipCount)"
        }
    }

    @IBOutlet weak var flipCountLabel: UILabel!
    
    @IBOutlet var cardButtons: [UIButton]!
    
    
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            print("card number \(cardNumber)")
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
            }
        else {
            print("Card not found!")
        }
    }
    
    
    
    
    func updateViewFromModel() {
        //for each button in the cardbuttons array
        for index in cardButtons.indices {
            //assign a button and a card to each element in button array
            let button = cardButtons[index]
            let card = game.cards[index]
            // face up or face down?
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            }
            else {
                button.setTitle("", for: UIControl.State.normal)
                // if card is matched then its opaque (clear) if not its orange. Ternary
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻","🍅","💀","🎃","🤡","🦹🏼‍♂️","🤖","👽"]
    //dictionary of emojis
    var emoji  = [Int:String]()


    
    func emoji(for card: Card) -> String {
        //Puts the emoji on the card if there is none i.e nil returned and that there are emojis left to take since we are removing them from the array to avoid duplication
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            // put a random emoji from emojiChopices in the card, removing it from emojichoices
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        
        //Check if the card id is not nil if it is return ?
        return emoji[card.identifier] ?? "?"
        
    }
    
}

