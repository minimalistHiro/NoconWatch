//
//  ClockView.swift
//  NoconWatch
//
//  Created by 金子広樹 on 2023/08/03.
//

import SwiftUI

struct ClockView: View {
    let setting = Setting()
    
    @State private var nowDate = Date()
    // 時間、分、秒取得
    @State private var hour = Calendar.current.component(.hour, from: Date())
    @State private var minute = Calendar.current.component(.minute, from: Date())
    @State private var second = Calendar.current.component(.second, from: Date())
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    // 各種サイズ
    let circleSize: CGFloat = 330                   // 円のサイズ
    let longHandsSize: CGFloat = 250                // 長針サイズ
    let shortHandsSize: CGFloat = 200               // 短針サイズ
    let hourClockNumberSize: CGFloat = 50           // 時間を示す針のサイズ
    let hourClockNumberPadding: CGFloat = 280       // 時間を示す針のPadding
    let minuteClockNumberSize: CGFloat = 20         // 時間を示す針のサイズ
    let minuteClockNumberPadding: CGFloat = 300     // 時間を示す針のPadding
    let numberPadding: CGFloat = 250                // "3","6","9","12"の数字のPadding
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 10)
                .frame(width: circleSize, height: circleSize)
            ForEach(0..<12) { num in
                ClockHands()
                    .frame(width: hourClockNumberSize, height: hourClockNumberSize)
                    .padding(.bottom, hourClockNumberPadding)
                    .rotationEffect(.degrees(Double(num * (360 / 12))))
            }
            ForEach(0..<60) { num in
                ClockHands()
                    .frame(width: minuteClockNumberSize, height: minuteClockNumberSize)
                    .padding(.bottom, minuteClockNumberPadding)
                    .rotationEffect(.degrees(Double(num * (360 / 60))))
            }
            Text("12")
                .font(.system(size: 30))
                .bold()
                .padding(.bottom, numberPadding)
            Text("3")
                .font(.system(size: 30))
                .bold()
                .padding(.leading, numberPadding)
            Text("6")
                .font(.system(size: 30))
                .bold()
                .padding(.top, numberPadding)
            Text("9")
                .font(.system(size: 30))
                .bold()
                .padding(.trailing, numberPadding)
            // 時
            ClockHands()
                .frame(width: shortHandsSize, height: shortHandsSize)
                .foregroundColor(setting.able)
                .rotationEffect(.degrees(Double(hour * 30) + Double(minute) * 0.5))
            // 分
            ClockHands()
                .frame(width: longHandsSize, height: longHandsSize)
                .foregroundColor(setting.able)
                .rotationEffect(.degrees(Double(minute * 6)))
            // 秒
            ClockHands()
                .frame(width: longHandsSize, height: longHandsSize)
                .foregroundColor(.red)
                .rotationEffect(.degrees(Double(second * 6)))
        }
        .onReceive(timer) { _ in
            self.nowDate = Date()
            self.hour = Calendar.current.component(.hour, from: nowDate)
            self.minute = Calendar.current.component(.minute, from: nowDate)
            self.second = Calendar.current.component(.second, from: nowDate)
        }
    }
}

struct ClockView_Previews: PreviewProvider {
    static var previews: some View {
        ClockView()
    }
}
