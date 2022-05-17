//
//  Concentration.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import Foundation

class Concentration {
    var cards =  [Card]()
    
    var indexOfOneAndOnlyFaceUpCard: Int?
    
    init(number: Int) {
        for _ in 1...number {
            let card = Card()
            cards += [card, card]
        }
    }
    
    func chooseCard(_ index: Int){
        
        if !cards[index].isMatched {
            if let matchIndex = indexOfOneAndOnlyFaceUpCard, matchIndex != index {
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = nil
            }else{
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFaceUpCard = index
            }
        }
    }
}
