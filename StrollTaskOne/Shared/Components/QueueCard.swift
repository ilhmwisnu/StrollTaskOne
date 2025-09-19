//
//  QueueCard.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

struct QueueCard: View {
    
    var queues: Int = 0
    var images: [String] = []
    
    var body: some View {
        HStack(spacing: -4) {
            Text("+\(queues)")
                .font(.system(size: 10, weight: .bold))
                .padding(.vertical, 4)
                .padding(.horizontal, 5)
                .background(.backgroundBlack)
                .cornerRadius(20)
                .foregroundColor(.textWhite)
                .zIndex(5)

            ForEach(images.indices, id: \.self) { i in
                Image(images[i])
                    .resizable()
                    .blur(radius: 2)
                    .scaledToFill()
                    .frame(width: 18, height: 18)
                    .clipShape(Circle())
                    .overlay(
                        Circle()
                            .stroke(Color.black, lineWidth: 1.5)
                    ).zIndex(4-Double(i))
            }

            

        }
        .padding(15)
        .frame(height: 205)
        .background(.backgroundDark)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.25), radius: 4, x: 2, y: 4)
    }
}

#Preview {
    QueueCard(
        queues: 10,
        images: ["imgUserA","imgUserB","imgUserC"]
    )
}
