//
//  ChatTile.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct ChatTile: View {

    var data: ChatRoom

    var isNewChat: Bool {
        data.chats.last?.content == .voice && !(data.isOpened)
    }

    var lastMessage: Chat { data.chats.last! }

    @ViewBuilder
    var lastMessageView: some View {

        if lastMessage.content == .text {
            Text(
                lastMessage.isUser
                    ? "You:\(lastMessage.textMessage!.message)"
                    : lastMessage.textMessage!.message
            )
            .font(.system(size: 14, weight: .semibold))
            .foregroundColor(lastMessage.isUser ? .textChat : .textWhite)
            .lineLimit(2)
        } else {
            HStack(spacing: 12) {
                Image("icMic")
                    .font(.system(size: 22, weight: .semibold))

                Image("icWave")

                Text(FormatHelper.secondsToString(lastMessage.voiceMessage?.voiceMessageDuration ?? 0))
                    .font(.system(size: 14, weight: .bold))
                    .monospacedDigit()
            }
            .imageForeground("imgTexture")
        }
    }

    var body: some View {
        HStack(spacing: 0) {
            Image(data.imagePath)
                .resizable()
                .scaledToFill()
                .frame(width: 52, height: 52)
                .clipShape(
                    Circle()
                )
                .padding(.horizontal, 5)
                .shadow(color: .black, radius: 10, x: 0, y: 0)
                .padding(.bottom, 8)
            VStack(spacing: 8) {
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Text(data.name)
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.textWhite)

                            if data.isUserMove {
                                ChatTag(type: .yourMove)
                            }

                            if isNewChat {
                                ChatTag(type: .newChat)
                            }

                        }
                        lastMessageView
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 5) {
                        Text(FormatHelper.formatDate(lastMessage.sendAt)).font(
                            .system(size: 12, weight: .semibold)

                        )
                        .foregroundColor(
                            lastMessage.isUser ? .textChatDate : .textSecondary
                        )

                        if isNewChat || data.chats.count > 1 {
                            ChatBadge(
                                label: isNewChat ? "★" : "\(data.chats.count)"
                            )
                        }

                    }
                    .foregroundColor(.textSecondary)
                    .frame(width: 55, height: 55, alignment: .topTrailing)
                }
                .padding(.leading, 10)
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.borderBlack2)
            }
            .padding(.trailing, 6)
        }
        .padding(.horizontal, 10)
        .padding(.top, 7)
    }
}

#Preview {
    VStack(spacing: 0) {
        ForEach(chatRooms) { room in
            ChatTile(data: room).background(.backgroundBlack)
        }
    }

}
