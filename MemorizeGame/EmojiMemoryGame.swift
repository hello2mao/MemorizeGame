//
//  EmojiMemoryGame.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/12.
//

import SwiftUI

class EmojiMemoryGame: ObservableObject {
    static var emojis = ["🌵", "🦨", "🍄", "🐶", "🐸", "🐝", "🪰", "🐖", "🐛", "🍩", "🍓", "🐞", "🐬", "🐯", "🌝", "💍", "👻", "🩴", "😎", "👜", "🐁"]
    
    @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 8) {
        pairIndex in
        emojis[pairIndex]
    }
    
    var cards: Array<MemoryGame<String>.Card> {
        model.cards
    }
    
    func choose(_ card: MemoryGame<String>.Card) {
        model.choose(card)
    }
}
