//
//  MemoryGame.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 27-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import Foundation

struct MemoryGame<CardContent> {
    var cards: [Card]

    mutating func choose(card: Card) {
        print("Chosen card: \(card)")
        let chosenIndex = self.index(of: card)
        self.cards[chosenIndex].isFaceUp = !self.cards[chosenIndex].isFaceUp
    }

    func index(of card: Card) -> Int {
        for index in 0..<self.cards.count {
            if self.cards[index].id == card.id {
                return index
            }
        }

        return 0 // TODO: bogus!
    }

    init(numberOfPairsOfCards: Int, cardContentFactory: (Int) -> CardContent) {
        cards = [Card]()
        for pairIndex in 0..<numberOfPairsOfCards {
            let content = cardContentFactory(pairIndex)
            cards.append(Card(id: pairIndex*2,  content: content))
            cards.append(Card(id: pairIndex*2+1, content: content))
        }
    }

    struct Card: Identifiable {
        var id: Int
        var isFaceUp: Bool = true
        var isMatched: Bool = false
        var content: CardContent
    }
}
