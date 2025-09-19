//
//  ChatData.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

let now: Date = Date()

let chatRooms: [ChatRoom] = [
    ChatRoom(
        isUserMove: false,
        name: "Jessica",
        imagePath: "imgChatA",
        isOpened: false,
        chats: [
            Chat(
                isUser: false,
                sendAt: now.addingTimeInterval(-5 * 60), // 5m ago
                content: .voice,
                voiceMessage: VoiceMessage(voiceMessageDuration: 58, sendAt: now.addingTimeInterval(-5 * 60))
            ),
        ]
    ),
    ChatRoom(
        isUserMove: false,
        name: "Amanda",
        imagePath: "imgUserA",
        isOpened: true,
        chats: [
            Chat(
                isUser: false,
                sendAt: now.addingTimeInterval(-2 * 24 * 60 * 60), // 2d ago
                content: .text,
                textMessage: TextMessage(
                    message: "Lol I love house music too",
                    sendAt: now.addingTimeInterval(-2 * 24 * 60 * 60)
                ),
                voiceMessage: nil
            )
        ]
    ),
    ChatRoom(
        isUserMove: false,
        name: "Sila",
        imagePath: "imgChatB",
        isOpened: false,
        chats: [
            Chat(
                isUser: true,
                sendAt: now.addingTimeInterval(-45 * 60), // 45m ago
                content: .text,
                textMessage: TextMessage(
                    message: "I love the people there tbh, have you been?",
                    sendAt: now.addingTimeInterval(-45 * 60)
                ),
                voiceMessage: nil
            )
        ]
    ),
    ChatRoom(
        isUserMove: true,
        name: "Marie",
        imagePath: "imgChatC",
        isOpened: false,
        chats: [
            Chat(
                isUser: true,
                sendAt: now.addingTimeInterval(-4 * 60 * 60), // 4h ago
                content: .voice,
                textMessage: nil,
                voiceMessage: VoiceMessage(
                    voiceMessageDuration: 42,
                    sendAt: now.addingTimeInterval(-4 * 60 * 60)
                )
            ),Chat(
                isUser: true,
                sendAt: now.addingTimeInterval(-4 * 60 * 60), // 4h ago
                content: .voice,
                textMessage: nil,
                voiceMessage: VoiceMessage(
                    voiceMessageDuration: 42,
                    sendAt: now.addingTimeInterval(-4 * 60 * 60)
                )
            ),Chat(
                isUser: true,
                sendAt: now.addingTimeInterval(-4 * 60 * 60), // 4h ago
                content: .voice,
                textMessage: nil,
                voiceMessage: VoiceMessage(
                    voiceMessageDuration: 42,
                    sendAt: now.addingTimeInterval(-4 * 60 * 60)
                )
            ),
            Chat(
                isUser: false,
                sendAt: now.addingTimeInterval(-3 * 60 * 60 + -30 * 60), // 3h30m ago
                content: .text,
                textMessage: TextMessage(
                    message: "Hahaha that’s interesting, it does seem like people here are starting to like house music more",
                    sendAt: now.addingTimeInterval(-3 * 60 * 60 + -30 * 60)
                ),
                voiceMessage: nil
            )
            
        ]
    ),
    ChatRoom(
        isUserMove: true,
        name: "Jessica",
        imagePath: "imgChatB",
        isOpened: true,
        chats: [
            Chat(
                isUser: false,
                sendAt: now.addingTimeInterval(-5 * 60), // 5m ago
                content: .voice,
                voiceMessage: VoiceMessage(voiceMessageDuration: 54, sendAt: now.addingTimeInterval(-5 * 60))
            ),
        ]
    ),
]

#Preview {
    VStack(spacing: 0) {
        ForEach(chatRooms) { room in
            ChatTile(data: room).background(.backgroundBlack)
        }
    }
    

}
