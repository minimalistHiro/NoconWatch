//
//  ClockNumber.swift
//  NoconWatch
//
//  Created by 金子広樹 on 2023/08/03.
//

import SwiftUI

struct ClockNumber: View {
    var screenWidth = UIScreen.main.bounds.width
    var screenHeight = UIScreen.main.bounds.height
    
    @State var color: Color                 // 針の色
    @State var lineWidth: CGFloat           // 線の太さ
    
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: screenWidth / 2, y: screenHeight / 2))
            path.addLine(to:CGPoint(x: screenWidth / 2, y: screenHeight / 2 - (screenWidth * 1 / 12)))
        }.stroke(color, lineWidth: lineWidth)
    }
}

struct ClockNumber_Previews: PreviewProvider {
    static var previews: some View {
        ClockNumber(color: .black, lineWidth: 4)
    }
}
