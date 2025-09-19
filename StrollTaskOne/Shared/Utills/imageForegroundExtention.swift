//
//  imageForegroundExtension.swift
//  StrollTaskOne
//
//  Created by Ilham Wisnu on 19/09/25.
//

import SwiftUI

extension View {
    func imageForeground(
        _ name: String,
        contentMode: ContentMode = .fill
    ) -> some View {
        self
            .overlay {
                GeometryReader { geo in
                    Image(name)
                        .resizable()
                        .aspectRatio(contentMode: contentMode)
                        .frame(width: geo.size.width, height: geo.size.height)
                        .clipped()
                }
            }
            .mask(self)
    }
}
