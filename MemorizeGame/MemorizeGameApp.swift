//
//  MemorizeGameApp.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/11.
//

import SwiftUI

@main
struct MemorizeGameApp: App {
    let game = EmojiMemoryGame()
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: game)
        }
    }
}
