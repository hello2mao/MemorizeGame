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
        
        typealias Card = MemoryGame<String>.Card
        private static var emojis = ["🌵", "🦨", "🍄", "🐶", "🐸", "🐝", "🙈", "🐖", "🐛", "🍩", "🍓", "🐞", "🐬", "🐯", "🌝", "💍", "👻", "🩴", "😎", "👜", "🐁"].shuffled()
        
        @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 8) {
            pairIndex in
            emojis[pairIndex]
        }
        
        var cards: Array<MemoryGame<String>.Card> { model.cards }
        
        var isFinish: Bool { model.isFinish }
        
        // MARK: - Intent(s)
        
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
        
        func reset() {
            model.reset()
        }
        

    }
}

