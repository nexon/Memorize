//
//  ContentView.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 27-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var viewModel: EmojiMemoryGame

    var body: some View {
        HStack {
            ForEach(viewModel.cards) { card in
                CardView(card: card)
                    .onTapGesture {
                        self.viewModel.choose(card: card)
                }
                .aspectRatio(CGSize(width: 2, height: 3), contentMode: .fit)
            }
        }
        .padding()
        .foregroundColor(Color.orange)
        .font(viewModel.cards.count == 5 ? .body : .largeTitle)
    }
}

// MARK: - CardView

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        ZStack {
            if card.isFaceUp {
                RoundedRectangle(cornerRadius: 10).fill(Color.white)
                RoundedRectangle(cornerRadius: 10).stroke(lineWidth: 3)
                Text(card.content)
            } else {
                RoundedRectangle(cornerRadius: 10).fill(Color.orange)
            }
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: EmojiMemoryGame())
    }
}
