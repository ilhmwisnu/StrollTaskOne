//
//  ChatTile.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct ChatTile: View {
    
    var body: some View {
        HStack(spacing: 0) {
            Circle()
                .fill(Color.gray)
                .frame(width: 52)
                .padding(.horizontal,5)
                .padding(.bottom,8)
                .shadow(color: .black, radius: 10 , x: 0, y: 0)
            VStack(spacing: 8) {
                HStack(spacing: 10) {
                    VStack(alignment: .leading) {
                        HStack(spacing: 10) {
                            Text("Jessica")
                                .font(.system(size: 16, weight: .bold))
                                .foregroundColor(.textWhite)
                            ChatTag(type: .yourMove)
                        }
                        HStack(spacing: 10) {
                            Text("Lol I love house music too")
                                .font(.system(size: 14, weight: .semibold))
                                .foregroundColor(.textWhite)
                        }
                    }
                    Spacer()
                    VStack(alignment: .trailing, spacing: 5) {
                        Text("2:12 pm").font(.system(size: 12, weight: .semibold))
                        ChatBadge(label: "★")
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
        .padding(.horizontal,10)
        .padding(.top,7)
    }
}

#Preview {
    ChatTile()
            .background(.backgroundBlack)
}
