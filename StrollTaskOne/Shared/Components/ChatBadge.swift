//
//  ChatBadge.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 18/09/25.
//

import SwiftUI

struct ChatBadge: View {
    
    var label = ""
    
    var body: some View {
        Text(label)
            .font(.system(size: 10, weight: .semibold))
            .foregroundColor(.black)
            .padding(.horizontal, 5)
            .padding(.vertical, 2)
            .background(.textPrimary)
            .cornerRadius(10)
    }
}

#Preview {
    ChatBadge(label: "1")
}
