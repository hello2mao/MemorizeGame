//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/12.
//

import Foundation

struct MemoryGame<CardContent> {
    struct Card: Identifiable{
        var id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        var content: CardContent
    }
    
    private(set) var cards: Array<Card>
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent) {
        cards = Array<Card>()
        for pairdIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: pairdIndex*2, content: createCardContent(pairdIndex)))
            cards.append(Card(id: pairdIndex*2+1, content: createCardContent(pairdIndex)))
        }
    }
    
    mutating func choose(_ card: Card) {
        let chosenIndex = index(of: card)
        cards[chosenIndex].isFaceUp.toggle()
        print("choose card: \(card)")
    }
    
    func index(of card: Card) -> Int {
        for index in 0..<cards.count {
            if cards[index].id == card.id {
                return index
            }
        }
        return 0
    }
}
