//
//  ContentView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/11.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: EmojiMemoryGame
    
    var body: some View {
        VStack {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
                ForEach(viewModel.cards) {
                    card in
                    CardView(card: card)
                        .aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        .onTapGesture {
                            viewModel.choose(card)
                        }
                }
            }.foregroundColor(.orange)
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    viewModel.reset()
                }, label: {
                    Text("重新开始")
                        .padding()
                        .background(Color.white)
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/, width: /*@START_MENU_TOKEN@*/1/*@END_MENU_TOKEN@*/)
                        .cornerRadius(3)
                })
            }
        }
        .padding()
        .onTapGesture {
            if viewModel.isFinish() == true {
                viewModel.reset()
            }
        }
        
    }
}

struct CardView: View {
    let card: MemoryGame<String>.Card
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if card.isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(card.content).font(.largeTitle)
            } else if card.isMatched == true {
                shape.opacity(0)
            } else {
                shape.fill(Color.orange)
            }
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let game = EmojiMemoryGame()
        ContentView(viewModel: game)
    }
}
