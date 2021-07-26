//
//  Pie.swift
//  MemorizeGame
//
//  Created by 毛宏斌 on 2021/7/25.
//

import SwiftUI

struct Pie: Shape {
    
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false
    
    func path(in rect: CGRect) -> Path {
        // 中心
        let center = CGPoint(x: rect.midX, y: rect.midY)
        // 半径
        let radius = min(rect.width, rect.height) / 2
        
        let start = CGPoint(
            x: center.x + radius * CGFloat(cos(startAngle.radians)),
            y: center.y + radius * CGFloat(sin(startAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
            center: center,
            radius: radius,
            startAngle: startAngle,
            endAngle: endAngle,
            clockwise: !clockwise
        )
        return p
    }
    
}


// MARK: - Preview

struct Pie_Previews: PreviewProvider {
    static var previews: some View {
        Pie(startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 110))
            .padding()
            .foregroundColor(.orange)
            .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
    }
}
