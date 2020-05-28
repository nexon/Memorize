//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 27-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import Foundation

struct EmojiMemoryGame {
    var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","😀"]
        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { emojis[$0] }
    }

    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards.shuffled()
    }

    // MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
