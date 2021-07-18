//
//  ContentView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/11.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            splashImageBackground.overlay(
                VStack {
                    Spacer()
                    NavigationLink(
                        destination: MemoryGameView(viewModel: .init()),
                        label: {
                            Text("开始游戏")
                                .font(.largeTitle)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(30)
                                .shadow(radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/)
                                .shadow(color: .white, radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        })
                }
                
            )
        }
    }
    
    private var splashImageBackground: some View {
        GeometryReader { geometry in
            Image("OnboardingSplash")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
                .frame(width: geometry.size.width)
        }
    }
}

// MARK: - Preview

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
