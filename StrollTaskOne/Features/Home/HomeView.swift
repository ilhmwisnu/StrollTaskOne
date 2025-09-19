//
//  HomeView.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 0) {
            MatchesView()
                .overlay(alignment: .bottom) {
                    BottomOverlay()
                }
            BottomNavigationBar(selectedPage: .constant(.chat))
                .background(.backgroundBlack)
        }
        .background(Background())
    }
}

#Preview {
    HomeView()
}

struct BottomOverlay: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(stops: [
                .init(
                    color: Color.overlayBlack.opacity(1.0),
                    location: 0.0
                ),
                .init(
                    color: Color.overlayBlack.opacity(0.8),
                    location: 0.45
                ),
                .init(
                    color: Color.overlayBlack.opacity(0.65),
                    location: 0.60
                ),
                .init(
                    color: Color.overlayBlack.opacity(0),
                    location: 1
                ),
            ]),
            startPoint: .bottom,
            endPoint: .top
        )
        .frame(maxHeight: 70)
    }
}



