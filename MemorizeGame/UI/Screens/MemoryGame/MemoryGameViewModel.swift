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
        
        private static var emojis = ["🌵", "🦨", "🍄", "🐶", "🐸", "🐝", "🙈", "🐖", "🐛", "🍩", "🍓", "🐞", "🐬", "🐯", "🌝", "💍", "👻", "🩴", "😎", "👜", "🐁"]
        
        @Published private var model = MemoryGame<String>(numberOfPairsOfCards: 8) {
            pairIndex in
            return emojis[pairIndex]
        }
        
        var cards: Array<MemoryGame<String>.Card> { model.cards }
        
        var isFinish: Bool { model.isFinish }
        var stepNum: Int { model.stepNum }
        
        // MARK: - Intent(s)
        
        func choose(_ card: MemoryGame<String>.Card) {
            model.choose(card)
        }
        
        func reset() {
            model = MemoryGame<String>(numberOfPairsOfCards: 8) {
                pairIndex in
                return MemoryGameView.ViewModel.emojis[pairIndex]
            }
        }
    }
}

