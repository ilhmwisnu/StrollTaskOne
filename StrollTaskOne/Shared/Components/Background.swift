//
//  Background.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct Background: View {
    var body: some View {
        ZStack {
            Image("imgBackground")
                .resizable()
                .edgesIgnoringSafeArea(.all)
            ZStack {
                Color.black.opacity(0.3)
                VStack {
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(
                                color: Color.overlayBlack.opacity(0.8),
                                location: 0
                            ),
                            .init(
                                color: Color.overlayBlack.opacity(0.3),
                                location: 0.39
                            ),
                            .init(
                                color: Color.overlayBlack.opacity(0),
                                location: 1
                            ),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ).frame(height: 235)
                    Spacer()
                    LinearGradient(
                        gradient: Gradient(stops: [
                            .init(
                                color: Color.overlayBlack.opacity(0),
                                location: 0
                            ),
                            .init(
                                color: Color.overlayBlack.opacity(0.65),
                                location: 0.45
                            ),
                            .init(
                                color: Color.overlayBlack.opacity(0.8),
                                location: 0.6
                            ),
                            .init(
                                color: Color.overlayBlack.opacity(1),
                                location: 1
                            ),
                        ]),
                        startPoint: .top,
                        endPoint: .bottom
                    ).frame(height: 250)
                }
            }
            LinearGradient(
                gradient: Gradient(stops: [
                    .init(
                        color: Color.backgroundOverlay.opacity(0),
                        location: 0
                    ),
                    .init(
                        color: Color.backgroundOverlay.opacity(1),
                        location: 0.65
                    ),
                    .init(
                        color: Color.backgroundOverlay.opacity(1),
                        location: 1
                    ),
                ]),
                startPoint: .top,
                endPoint: .bottom
            )
        }.ignoresSafeArea()
    }
}

#Preview {
    Background()
}
