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
        GeometryReader { geometry in
            ZStack {
                let shape = RoundedRectangle(cornerRadius: 10)
                if card.isFaceUp {
                    shape.fill(Color.white)
                    shape.strokeBorder(lineWidth: 3)
                    Text(card.content).font(font(in: geometry.size))
                } else if card.isMatched == true {
                    shape.opacity(0)
                } else {
                    shape.fill(Color.orange)
                }
            }
        }
    }
    
    private func font(in size: CGSize) -> Font {
        Font.system(size: min(size.width, size.height) * DrawingConstants.fontScale)
    }
    
    private struct DrawingConstants {
        static let cornerRadius: CGFloat = 10
        static let lineWidth: CGFloat = 3
        static let fontScale: CGFloat = 0.5
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
