//
//  YourTurnCard.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct YourTurnCard: View {

    var name: String
    var age: Int
    var question: String

    var imagePath: String
    var isTheirMove: Bool = false
    var onTap: () -> Void = {}
    var isReviewed: Bool = false

    @ViewBuilder
    var headerText: some View {
        if !isTheirMove {

        }
    }

    var body: some View {
        ZStack(alignment: .top) {
            Image(imagePath)
                .resizable()
                .scaledToFill()
            if !isReviewed {
                Rectangle()
                    .fill(.ultraThinMaterial.opacity(1))
                Image(imagePath)
                    .resizable()
                    .scaledToFill()
                    .blur(radius: 20)
                Text("Tap to answer")
                    .font(.system(size: 10, weight: .bold))
                    .foregroundColor(.textLightGrey)
                    .padding(.top, 82)
            }
            LinearGradient(
                colors: [
                    Color.backgroundOverlay,
                    Color.clear,
                ],
                startPoint: .bottom,
                endPoint: .top
            )
            VStack {
                Spacer()
                VStack(spacing: 5) {
                    Text("\(name), \(age)")
                        .multilineTextAlignment(.center)
                        .font(.system(size: 15, weight: .bold))
                        .foregroundColor(.white)
                    Text(
                        question
                    )
                    .multilineTextAlignment(.center)
                    .font(.system(size: 10))
                    .foregroundColor(.textPrimaryLight)
                }
                .frame(height: 94, alignment: .bottom)
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 15)
                .padding(.bottom, 12)
            }

            if !isReviewed && isTheirMove {
                Text("📣 They made a move!")
                    .font(.system(size: 9, weight: .semibold))
                    .padding(.horizontal, 10)
                    .padding(.vertical, 4)
                    .background(.backgroundOverlay).foregroundColor(.textWhite)
                    .cornerRadius(10)
                    .padding(.top, 11)
                    .padding(.horizontal, 4)
            }

            HStack {
                if isTheirMove && isReviewed {
                    Text("📣")
                        .font(.system(size: 12, weight: .semibold))
                        .padding(6)
                        .background(
                            Circle()
                                .fill(.backgroundBlack)
                        )
                }
                Spacer()
                if isReviewed {
                    TimerInfo(time: 16)
                        .padding(4)
                }
            }
            .padding(.top, 8)
            .padding(.horizontal, 8)

        }
        .frame(width: 145, height: 205)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 4)
    }
}

#Preview {
    YourTurnCard(
        name: "Amanda",
        age: 22,
        question: "Question",
        imagePath: "imgUserA",
        isTheirMove: true,
        isReviewed: false
    )
    .padding()
    .background(.backgroundBlack)
}
