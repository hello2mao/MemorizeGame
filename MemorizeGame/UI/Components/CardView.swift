//
//  CardView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/14.
//

import SwiftUI

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.system(size:70))
            } else if card.isMatched == true {
                shape.opacity(0)
            } else {
                shape.fill(Color.orange)
            }
        }
    }
}

// MARK: - Preview

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
            ForEach(0..<16) {
                index in
                let card = MemoryGame<String>.Card(id: 1, isFaceUp: true, content: "👻")
                CardView(card: card)
                    .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
            }
        }
        .padding()
        .foregroundColor(.orange)
        
    }
}
