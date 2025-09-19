//
//  ChatTagType.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

enum ChatTagType {
    case yourMove
    case newChat
}

struct ChatTag: View {

    let type: ChatTagType

    var body: some View {

        switch type {
        case .newChat:
            HStack(spacing: 6) {
                Circle()
                    .fill(.white)
                    .frame(width: 5)
                Text("New Chat")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
                    .lineLimit(1)  // force single line
                    .truncationMode(.tail)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(.appSecondary.opacity(0.8))
            .cornerRadius(99)
        case .yourMove:
            HStack(spacing: 6) {
                Text("Your move")
                    .font(.system(size: 10, weight: .semibold))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 8)
            .padding(.vertical, 2)
            .background(.backgroundDarkGrey.opacity(0.8))
            .cornerRadius(10)
        }
    }
}

#Preview {
    ChatTag(type: .newChat)
}
