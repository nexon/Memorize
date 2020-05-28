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
        let emojis = ["👻","🎃","🕷","😀", "😉"]

        let shuffledEmojis = emojis
            .prefix(upTo: Int.random(in: 2...5))

        return MemoryGame<String>(numberOfPairsOfCards: shuffledEmojis.count) { shuffledEmojis[$0] }
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
