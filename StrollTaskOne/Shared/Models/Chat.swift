import Foundation

struct ChatRoom: Identifiable {
    let id = UUID()

    var isUserMove: Bool
    var name: String
    var imagePath: String
    var isOpened: Bool
    var chats: [Chat]
}

struct Chat: Identifiable {
    let id = UUID()

    var isUser: Bool
    var sendAt: Date
    var content: ChatContent
    var textMessage: TextMessage?
    var voiceMessage: VoiceMessage?
}

enum ChatContent: Equatable {
    case text
    case voice
}

struct TextMessage {
    var message: String
    var sendAt: Date         
}

struct VoiceMessage {
    var voiceMessageDuration: Int
    var sendAt: Date
}

extension Chat {
    static func text(_ message: String,
                     isUser: Bool,
                     sendAt: Date = .init()) -> Chat {
        Chat(
            isUser: isUser,
            sendAt: sendAt,
            content: .text,
            textMessage: TextMessage(message: message, sendAt: sendAt),
            voiceMessage: nil
        )
    }

    static func voice(duration seconds: Int,
                      isUser: Bool,
                      sendAt: Date = .init()) -> Chat {
        Chat(
            isUser: isUser,
            sendAt: sendAt,
            content: .voice,
            textMessage: nil,
            voiceMessage: VoiceMessage(voiceMessageDuration: seconds, sendAt: sendAt)
        )
    }
}
