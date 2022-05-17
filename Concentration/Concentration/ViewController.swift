//
//  ViewController.swift
//  Concentration
//
//  Created by ad1 on 17.05.2022.
//

import UIKit

class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(number: (cardButtons.count + 1) / 2)
    
    var flipCount: Int = 0 {
            didSet {
                flipCountLabel.text = "Flips: \(flipCount)"
            }
        }
        
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = cardButtons.firstIndex(of: sender){
            print("cardNumber = \(cardNumber)")
            game.chooseCard(cardNumber)
            updateViewFromModel()
        }else{
            print("not exist")
        }
    }
    
    func updateViewFromModel(){
        for index in cardButtons.indices{
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp{
                button.setTitle(emoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }else{
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiJoices: [String] = ["👻","🎃","😁","🤖","😼","🤝"]
    var emoji = Dictionary<Int, String>()
    
    func emoji(for card: Card)-> String {
        if emoji[card.identifier] == nil, emojiJoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiJoices.count)))
                emoji[card.identifier] = emojiJoices.remove(at: randomIndex)
            }
        return emoji[card.identifier] ?? "?"
    }
}

