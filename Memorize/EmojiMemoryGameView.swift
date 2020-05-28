//
//  EmojiMemoryGameView.swift
//  Memorize
//
//  Created by Alberto Lagos Toro on 27-05-20.
//  Copyright © 2020 Alberto Lagos Toro. All rights reserved.
//

import SwiftUI

struct EmojiMemoryGameView: View {
    @ObservedObject var viewModel: EmojiMemoryGame

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
    }
}

// MARK: - CardView

struct CardView: View {
    var card: MemoryGame<String>.Card

    var body: some View {
        GeometryReader { geometry in
            self.body(for: geometry.size)
        }
    }

    func body(for size: CGSize) -> some View {
        ZStack {
            if self.card.isFaceUp {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.white)
                RoundedRectangle(cornerRadius: self.cornerRadius).stroke(lineWidth: self.edgeLineWidth)
                Text(self.card.content)
            } else {
                RoundedRectangle(cornerRadius: self.cornerRadius).fill(Color.orange)
            }
        }
        .font(.system(size: fontSize(for: size)))
    }

    // MARK: - Drawing Constants

    let cornerRadius: CGFloat = 10
    let edgeLineWidth: CGFloat = 3
    let fontScaleFactor: CGFloat = 0.75

    func fontSize(for size: CGSize) -> CGFloat {
        min(size.width, size.height) * fontScaleFactor
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiMemoryGameView(viewModel: EmojiMemoryGame())
    }
}
