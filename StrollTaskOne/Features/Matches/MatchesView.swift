//
//  MatchesView.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct MatchesView: View {

    @State var selectedTab: MatchesTab = .chats

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 29) {
                VStack(spacing: 20) {
                    MatchesHeader(
                        turn: 1,
                        rep: 90
                    )
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15) {
                            YourTurnCard(
                                name: "Amanda", age: 22, question: "What is your most favorite childhood memory?", imagePath: "imgUserA"
                            )
                            YourTurnCard(
                                name: "Malte", age: 31, question: "What is the most important quality in friendships to you?", imagePath: "imgUserB", isTheirMove: true
                            )
                            YourTurnCard(
                                name: "Binghan", age: 28, question: "If you could choose to have one superpower, what would it be?", imagePath: "imgUserC", isTheirMove: true,
                                isReviewed: true
                            )
                            QueueCard(
                                queues: 10, images: ["imgUserA", "imgUserB", "imgUserB"]
                            )

                        }.padding(.horizontal, 20)
                    }
                }
                VStack(spacing: 10) {
                    MatchesTabBar(selectedTab: $selectedTab)
                    Group {
                        switch selectedTab {
                        case .chats:
                            VStack(spacing: 0) {
                                ForEach(chatRooms) { room in
                                    ChatTile(data: room)
                                }
                            }
                        case .pending:
                            VStack {
                                Text("Pending View")
                                    .padding(20)
                                    .foregroundColor(.textWhite)
                            }
                        }
                    }
                    .transition(
                        .move(edge: .trailing)
                        .combined(with: .opacity)
                    )
                    .animation(.spring(), value: selectedTab)
                    .padding(.bottom, 40)
                }

            }

        }
    }
}

#Preview {
    MatchesView()
        .background(.backgroundBlack)
}


