//
//  MatchesHeader.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

struct MatchesHeader: View {
    
    var turn: Int = 0
    var rep : Int = 0
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 6) {
                HStack {
                    Text("Your Turn")
                        .font(.system(size: 22, weight: .bold))
                        .foregroundColor(.textWhite)
                    Text("\(turn)")
                        .font(.system(size: 10, weight: .bold))
                        .foregroundColor(.textBlack)
                        .padding(.horizontal, 5)
                        .padding(.vertical, 2)
                        .background(
                            Circle().fill(Color.backgroundSecondary)
                        )
                }
                Text("Make your move, they are waiting 🎵")
                    .font(.system(size: 12))
                    .foregroundColor(.textLightGrey)
            }
            Spacer()
            Rep(value: rep)
        }
        .padding(.horizontal, 20)
    }
}
