//
//  Helpers.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/18.
//

import Foundation

// MRAK: - General

extension Array {
    var oneAndOnly: Element? {
        if count == 1 {
            return first
        } else {
            return nil
        }
    }
}
