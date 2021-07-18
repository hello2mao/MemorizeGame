//
//  MemoryGameViewModel.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/12.
//

import SwiftUI

// MARK: - ViewModel

extension MemoryGameView {
    class ViewModel: ObservableObject {
        private static var emojis = ["🌵", "🦨", "🍄", "🐶", "🐸", "🐝", "🙈", "🐖", "🐛", "🍩", "🍓", "🐞", "🐬", "🐯", "🌝", "💍", "👻", "🩴", "😎", "👜", "🐁"].shuffled()
        
        @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 8) {
            pairIndex in
            emojis[pairIndex]
        }
        
        var cards: Array<MemoryGame<String>.Card> {
            model.cards
        }
        
        
        // MARK: - Intent(s)
        
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
        
        func reset() {
            model.reset()
        }
        
        func isFinish() -> Bool {
            return model.isFinish()
        }
    }
}

