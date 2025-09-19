//
//  MatchesTabBar.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

enum MatchesTab { case chats, pending }

struct MatchesTabBar: View {

    @Binding var selectedTab: MatchesTab
    @Namespace var animation

    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    tabButton(
                        "Chats",
                        tab: .chats,
                        isSelected: selectedTab == .chats
                    )
                    tabButton(
                        "Pending",
                        tab: .pending,
                        isSelected: selectedTab == .pending
                    )
                    Spacer(minLength: 0)
                }
                Group {
                    switch selectedTab {
                    case .chats:
                        Text("The ice is broken. Time to hit it off")
                            .transition(.opacity)
                    case .pending:
                        Text("Let them get back to you 🤞🏻")
                            .transition(.opacity)
                    }
                }
                .italic()
                .font(.system(size: 12))
                .foregroundColor(.textLightGrey)
            }
            .padding(.horizontal, 20)
        }
    }

    @ViewBuilder
    private func tabButton(_ title: String, tab: MatchesTab, isSelected: Bool)
        -> some View
    {
        Button {
            withAnimation(.spring()) {
                selectedTab = tab
            }
        } label: {
            Text(title)
                .foregroundColor( isSelected ?.white : .textDisabled)
                .font(.system(size: 22, weight: .bold))
        }
        .buttonStyle(.plain)
        .background(
            GeometryReader { geo in
                if isSelected {
                    Rectangle()
                        .fill(Color.white)
                        .frame(width: geo.size.width * 0.9, height: 2)
                        .offset(y: geo.size.height + 2)
                        .matchedGeometryEffect(id: "underline", in: animation)
                }
            }
        )
        .padding(.bottom, 2)
    }
}

#Preview {
    MatchesTabBar(
        selectedTab: .constant(.chats)
    )
    .background(.backgroundBlack)
}
