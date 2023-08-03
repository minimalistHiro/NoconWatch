//
//  ContentView.swift
//  NoconWatch
//
//  Created by 金子広樹 on 2023/08/03.
//

import SwiftUI

struct ContentView: View {
    let setting = Setting()
    @State private var isClockMode: Bool = false
    
    var body: some View {
        NavigationStack {
            if isClockMode {
                ClockView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isClockMode = false
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            } label: {
                                Image(systemName: "00.square")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(setting.able)
                            }
                        }
                    }
            } else {
                DigitalWatchView()
                    .toolbar {
                        ToolbarItem(placement: .navigationBarTrailing) {
                            Button {
                                isClockMode = true
                                UIImpactFeedbackGenerator(style: .light).impactOccurred()
                            } label: {
                                Image(systemName: "clock")
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(setting.able)
                            }
                        }
                    }
                }
            }
        .onAppear {
            // 画面の自動ロックを阻止。
            UIApplication.shared.isIdleTimerDisabled = true
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
