//
//  AccordionView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/17.
//

import SwiftUI

/// 手风琴视图
struct AccordionView: View {
    
    /// 是否动画
    @Binding var isAnimationState: Bool
    
    var body: some View {
        
        HStack(alignment: .center, spacing: isAnimationState ? 15 : 5) {
            
            // 循环创建指示器
            ForEach(0 ..< 7) { index in
                
                // 根据index是否：奇偶数。创建不同高度的矩形
                if index % 2 == 0 {             // 偶数
                    Capsule(style: .continuous)
                        .fill(Color.orange)
                        .frame(width: 10, height: 50)
                }else {                       // 奇数
                    Capsule(style: .continuous)
                        .fill(Color.orange)
                        .frame(width: 10, height: 30)
                }
            }
        }
        .frame(width: isAnimationState ? 150 : 100)
        .animation(Animation.easeInOut(duration: 0.9).repeatForever(autoreverses: true))
    }
}

// MARK: - Preview

struct AccordionViewPreviewContainer : View {
    @State private var isAnimate = false
    
    var body: some View {
        HStack {
            AccordionView(isAnimationState: $isAnimate)
        }
        .onAppear {
            self.isAnimate.toggle()
        }
    }
}

struct AccordionView_Previews: PreviewProvider {
    static var previews: some View {
        AccordionViewPreviewContainer()
    }
}
