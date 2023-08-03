//
//  ClockHands.swift
//  NoconWatch
//
//  Created by 金子広樹 on 2023/08/03.
//

import SwiftUI

struct ClockHands: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX - 2, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX - 2, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX + 2, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.midX + 2, y: rect.midY))
            path.closeSubpath()
        }
    }
}

struct ClockHands_Previews: PreviewProvider {
    static var previews: some View {
        ClockHands()
    }
}
