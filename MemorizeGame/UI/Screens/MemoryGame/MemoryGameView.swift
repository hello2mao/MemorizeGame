//
//  MemoryGameView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/14.
//

import SwiftUI

struct MemoryGameView: View {
    @ObservedObject var viewModel: ViewModel
    @State private var showFinishSheet = false
    
    var body: some View {
        VStack {
            Text("步数：\(viewModel.stepNum)")
                .font(.largeTitle)
                .foregroundColor(.orange)
            AspectVGrid(items: viewModel.cards, aspectRatio: 2/3) { card in
                if card.isMatched && !card.isFaceUp  {
                    Color.clear
                } else {
                    CardView(card: card)
                        .onTapGesture {
                            withAnimation(.linear(duration: 0.5)) {
                                viewModel.choose(card)
                            }
                            if viewModel.isFinish == true {
                                self.showFinishSheet = true
                            }
                        }
                }
            }
            .foregroundColor(.orange)
            .actionSheet(isPresented: $showFinishSheet) {
                ActionSheet(
                    title: Text("啦啦啦").font(.largeTitle),
                    message: Text("恭喜花花，通关啦，步数：\(viewModel.stepNum)"),
                    buttons: [
                        .default(Text("重新开始")) {
                            withAnimation {
                                self.showFinishSheet = false
                                viewModel.reset()
                            }
                        },
                    ]
                )
            }
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    withAnimation {
                        viewModel.reset()
                    }
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
        .navigationBarHidden(true)
        
    }
}

// MARK: - Preview

struct MemoryGameView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            MemoryGameView(viewModel: .init())
                .navigationBarTitle(Text("MemorizeGame"), displayMode: .inline)
        }
       
    }
}
