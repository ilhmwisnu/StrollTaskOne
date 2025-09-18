//
//  Rep.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

struct Rep: View {

    var value: Int = 0
    var photo: String = "imgRep"

    private let minProgressValue: Double = 0
    private let maxProgressValue: Double = 0.666

    private var progressValue: Double {
        return (Double(value) / 100.0) / 1 * maxProgressValue
    }

    var body: some View {
        ZStack(alignment: .bottom) {
            Image(photo)
                .padding(4)
                .background(RepProgressBar(value: progressValue))
                .shadow(color: .black.opacity(0.6), radius: 4, y: 4)
            Text("\(value)")
                .font(.system(size: 10.8, weight: .bold))
                .foregroundColor(.textWhite)
                .padding(.vertical, 2.7)
                .padding(.horizontal, 13.5)
                .background(.backgroundDarkerGrey)
                .cornerRadius(22.5)
                .offset(y:8)
        }
        .shadow(color: .textPrimary.opacity(0.25), radius: 8)

    }
}

struct RepProgressBar: View {

    var value: Double

    var body: some View {
        ZStack {
            Circle()
                .trim(from: 0, to: 0.666)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundColor(.borderGrey)
            Circle()
                .trim(from: 0, to: value)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 4,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundColor(.borderGreen)
            Circle()
                .trim(from: value - 0.0001, to: value)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: 6,
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .foregroundColor(.textPrimary)
        }.rotationEffect(.degrees(90 + 61))
    }
}

#Preview {
    Rep(
        value: 90
    )
    .padding(200)
    .background(.backgroundBlack)
}
