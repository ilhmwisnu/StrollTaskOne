//
//  TimerInfo.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

struct TimerInfo: View {
    
    var time : Int = 0
    
    var timePercentage : Double {
        Double(time) / 24.0
    }
    
    var body: some View {
        ZStack {
            Circle()
                .fill(.backgroundOverlay)
                .blur(radius: 8)
            Circle()
                .fill(.textWhite.opacity(0.2))
            Circle()
                .trim(from: 0, to: timePercentage)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 1.2,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundColor(.borderLightGrey)
                .rotationEffect(Angle(degrees: -90))
            Text("\(time)h")
                .font(.system(size: 6, weight: .bold))
                .foregroundColor(.textWhite)
        }
        .frame(width: 20)
    }
}

#Preview {
    TimerInfo(
        time: 18
    )
//        .padding()
//        .background(Color.backgroundBlack)
}
