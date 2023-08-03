//
//  DigitalWatchView.swift
//  NoconWatch
//
//  Created by 金子広樹 on 2023/08/03.
//

import SwiftUI

struct DigitalWatchView: View {
    // 日付
    @State private var nowDate = Date()
    @State private var dateText = ""
    private let dateFormatter = DateFormatter()
    
    // 時間、分、秒取得
    @State private var hour = Calendar.current.component(.hour, from: Date())
    @State private var minute = Calendar.current.component(.minute, from: Date())
    @State private var second = Calendar.current.component(.second, from: Date())
    
    let timer = Timer.publish(every: 1, on: .current, in: .common).autoconnect()
    
    // 各種時間表示テキストを1桁ずつ分ける
    var hourTensPlace: String {
        let number = String(format: "%02d", hour)
        return String(number.dropLast())
    }           // 時間の10の位
    var hourOnesPlace: String {
        let number = String(format: "%02d", hour)
        return String(number.dropFirst())
    }           // 時間の1の位
    var minutesTensPlace: String {
        let number = String(format: "%02d", minute)
        return String(number.dropLast())
    }           // 分の10の位
    var minutesOnesPlace: String {
        let number = String(format: "%02d", minute)
        return String(number.dropFirst())
    }           // 分の1の位
    var secondTensPlace: String {
        let number = String(format: "%02d", second)
        return String(number.dropLast())
    }           // 秒の10の位
    var secondOnesPlace: String {
        let number = String(format: "%02d", second)
        return String(number.dropFirst())
    }           // 秒の1の位
    
    // 各種サイズ
    let timerLabelFrameWidth: CGFloat = 40          // 時間表示テキストのフレーム横幅
    
    init() {
        dateFormatter.dateFormat = "YYYY/MM/dd"
        dateFormatter.locale = Locale(identifier: "ja_jp")
    }
    
    var body: some View {
        VStack(alignment: .center) {
            Text(dateText.isEmpty ? "\(dateFormatter.string(from: nowDate))" : dateText)
                .font(.system(size: 25))
            Spacer()
            HStack {
                Text(hourTensPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
                Text(hourOnesPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
                Text(":")
                Text(minutesTensPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
                Text(minutesOnesPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
                Text(":")
                Text(secondTensPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
                Text(secondOnesPlace)
                    .frame(width: timerLabelFrameWidth, alignment: .trailing)
            }
            .font(.system(size: 70))
            Spacer()
            // レイアウト崩れ防止用。
            Text("")
                .font(.system(size: 30))
        }
        .onReceive(timer) { _ in
            self.nowDate = Date()
            dateText = "\(dateFormatter.string(from: nowDate))"
            self.hour = Calendar.current.component(.hour, from: nowDate)
            self.minute = Calendar.current.component(.minute, from: nowDate)
            self.second = Calendar.current.component(.second, from: nowDate)
        }
    }
}

struct DigitalWatchView_Previews: PreviewProvider {
    static var previews: some View {
        DigitalWatchView()
    }
}
