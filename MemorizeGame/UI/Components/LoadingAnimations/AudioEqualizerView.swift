//
//  AudioEqualizerView.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/14.
//

import SwiftUI

/// 音频均衡器
struct AudioEqualizerView: View {
    /// 是否动画
    @Binding var isAnimationState: Bool
    
    var body: some View {
        
        HStack(alignment: .bottom, spacing: 10) {
            
            Capsule(style: .continuous)
                .fill(Color.red)
                .frame(width: 10, height: isAnimationState ? 100 : 20)
                .animation(Animation.linear(duration: 0.6).repeatForever().speed(2))
            
            Capsule(style: .continuous)
                .fill(Color.orange)
                .frame(width: 10, height: isAnimationState ? 100 : 20)
                .animation(Animation.linear(duration: 0.8).repeatForever().speed(2))
            
            Capsule(style: .continuous)
                .fill(Color.green)
                .frame(width: 10, height: isAnimationState ? 100 : 20)
                .animation(Animation.linear(duration: 0.7).repeatForever().speed(2))
            
            Capsule(style: .continuous)
                .fill(Color.blue)
                .frame(width: 10, height: isAnimationState ? 100 : 20)
                .animation(Animation.linear(duration: 0.5).repeatForever().speed(2))
            
            Capsule(style: .continuous)
                .fill(Color.yellow)
                .frame(width: 10, height: isAnimationState ? 20 : 100)
                .animation(Animation.linear(duration: 0.9).repeatForever().speed(2))
        }
    }
}


// MARK: - Preview

struct AudioEqualizerViewPreviewContainer : View {
    @State private var isAnimate = false

     var body: some View {
        HStack {
            AudioEqualizerView(isAnimationState: $isAnimate)
        }
        .onAppear {
            self.isAnimate.toggle()
        }
     }
}

struct AudioEqualizerView_Previews: PreviewProvider {
    static var previews: some View {
        AudioEqualizerViewPreviewContainer()
    }
}
