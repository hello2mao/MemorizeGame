//
//  MemoryGame.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/12.
//

import Foundation

struct MemoryGame<CardContent> where CardContent: Equatable {
    
    struct Card: Identifiable{
        let id: Int
        var isFaceUp: Bool = false
        var isMatched: Bool = false
        let content: CardContent
    }
    
    private(set) var cards: Array<Card>
    private var firstChooseIndex: Int? {
        get { cards.indices.filter({ cards[$0].isFaceUp}).oneAndOnly }
        set { cards.indices.forEach( {cards[$0].isFaceUp = ($0 == newValue)} )}
    }
    
    var isFinish: Bool {
        for index in cards.indices {
            if cards[index].isMatched == false {
                return false
            }
        }
        return true
    }
    
    init(numberOfPairsOfCards: Int, createCardContent: (Int)->CardContent) {
        cards = Array<Card>()
        for pairdIndex in 0..<numberOfPairsOfCards {
            cards.append(Card(id: pairdIndex*2, content: createCardContent(pairdIndex)))
            cards.append(Card(id: pairdIndex*2+1, content: createCardContent(pairdIndex)))
        }
//        cards = cards.shuffled()
    }
    
    mutating func reset() {
        cards.indices.forEach({
            cards[$0].isFaceUp = false
            cards[$0].isMatched = false
        })
//        cards = cards.shuffled()
    }
     
    mutating func choose(_ card: Card) {
        if let chosenIndex = cards.firstIndex(where: { $0.id == card.id }),
           !cards[chosenIndex].isMatched,
           !cards[chosenIndex].isFaceUp {
            if let fci = firstChooseIndex {
                if card.content == cards[fci].content {
                    cards[chosenIndex].isMatched = true
                    cards[fci].isMatched = true
                    
                }
                cards[chosenIndex].isFaceUp = true
            } else {
                firstChooseIndex = chosenIndex
            }
        }
        print("choose card: \(card)")
    }
}
