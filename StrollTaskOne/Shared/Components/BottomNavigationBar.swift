//
//  BottomNavigationBar.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct BottomNavigationBar: View {

    @Binding var selectedPage: BottomNavigationItemType

    var body: some View {
        VStack(spacing: 0) {
            Rectangle()
                .frame(height: 1)
                .foregroundColor(.borderBlack)
            HStack(alignment: .top, spacing: 0) {
                BottomNavigationItem(
                    isActive: selectedPage == .cards,
                    notificationCount: 10,
                    itemType: .cards
                )
                Spacer()
                BottomNavigationItem(
                    isActive: selectedPage == .bonfire,
                    itemType: .bonfire
                )
                Spacer()
                BottomNavigationItem(
                    isActive: selectedPage == .chat,
                    itemType: .chat
                )
                Spacer()
                BottomNavigationItem(
                    isActive: selectedPage == .profile(image: "imgProfile"),
                    itemType: .profile(image: "imgProfile")
                )
            }
            .padding(.horizontal, 15)
            .padding(.top, 3)
            Spacer()
        }
        .frame(height: 64)
    }
}

enum BottomNavigationItemType: Equatable {
    case cards
    case bonfire
    case chat
    case profile(image: String)
}

struct BottomNavigationItem: View {

    var isActive: Bool = false
    var notificationCount: Int?
    var itemType: BottomNavigationItemType

    @ViewBuilder
    var icon: some View {
        switch itemType {
        case .cards:
            Image(isActive ? "icPokerActive" : "icPokerDisabled")

        case .bonfire:
            Image(isActive ? "icBonfireActive" : "icBonfireDisabled")

        case .chat:
            Image(isActive ? "icChatsActive" : "icChatsDisabled")

        case .profile(let image):
            Image(image)
                .padding(2)
                .background {
                    Image(isActive ? "icCircularStrokeActive" : "icCircularStrokeDisabled")

                }
        }
    }

    var label: String {
        switch itemType {
        case .cards:
            return "Cards"
        case .bonfire:
            return "Bonfire"
        case .chat:
            return "Matches"
        case .profile:
            return "Profile"
        }
    }

    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 4) {
                icon.frame(maxWidth: 24, maxHeight: 24)
                Text(label)
                    .font(.system(size: 10, weight: .semibold))  //TODO: use the right font
                    .foregroundColor(.textDisabled)
            }
            if notificationCount != nil {
                Text(String(notificationCount!))
                    .font(.system(size: 7))
                    .bold()
                    .padding(.horizontal, 4)
                    .padding(.vertical, 2)
                    .background(
                        RoundedRectangle(cornerRadius: 15)
                            .stroke(Color.backgroundBlack, lineWidth: 1.4)
                            .background(Color.textPrimary.cornerRadius(15))
                    )

            }

        }
        .padding(.top, 8)
        .frame(minWidth: 38, maxHeight: 45)
    }
}

#Preview {
    BottomNavigationBar(
        selectedPage: .constant(.chat)
    ).background(.black)
}
