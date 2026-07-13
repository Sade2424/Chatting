//
//  ThemeManager.swift
//  Chatting
//
//  Created by Sade El Moudden on 12.06.2026.
//

import SwiftUI
internal import Combine

class ThemeManager: ObservableObject {
    @Published var selectedColor: Color = .blue
}
