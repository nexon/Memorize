//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 27-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import Foundation

class EmojiMemoryGame: ObservableObject {
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame()

    static func createMemoryGame() -> MemoryGame<String> {
        let emojis = ["👻","🎃","🕷","😀", "😉"]
            .prefix(upTo: Int.random(in: 2...5))

        return MemoryGame<String>(numberOfPairsOfCards: emojis.count) { emojis[$0] }
    }

    // MARK: - Access to the Model
    
    var cards: [MemoryGame<String>.Card] {
        model.cards
    }

    // MARK: - Intent(s)

    func choose(card: MemoryGame<String>.Card) {
        model.choose(card: card)
    }
}
