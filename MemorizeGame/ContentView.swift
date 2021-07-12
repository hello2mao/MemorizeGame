//
//  ContentView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/11.
//

import SwiftUI

struct ContentView: View {
    var emojis = ["🌵", "🦨", "🍄", "🐶", "🐸", "🐝", "🪰", "🐖", "🐛", "🍩", "🍓", "🐞", "🐬", "🐯", "🌝", "💍", "👻", "🩴", "😎", "👜", "🐁"]
    
    var body: some View {
        VStack {
            HStack {
                Text("得分：")
                Text("100")
            }
            .foregroundColor(Color.orange)
            .font(.largeTitle)
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 85))]) {
                    ForEach(emojis[0..<20], id: \.self) {
                        emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                    }
                }
            }
            .padding()
            .foregroundColor(.orange)
        }

    }
}

struct CardView: View {
    @State var isFaceUp: Bool = false
    var content: String
    
    var body: some View {
        ZStack {
            let shape = RoundedRectangle(cornerRadius: 10)
            if isFaceUp {
                shape.fill(Color.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill(Color.orange)
            }
        }
        .onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
