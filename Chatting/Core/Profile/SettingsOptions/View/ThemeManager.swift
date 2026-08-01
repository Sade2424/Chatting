//
//  ThemeManager.swift
//  Chatting
//
//  Created by Sade El Moudden on 12.06.2026.
//


import SwiftUI
internal import Combine



class ThemeManager: ObservableObject {

    @AppStorage("selectedTheme") private var selectedTheme = "Pastel Blue"

    @Published var selectedColor: Color = Color(
        red: 0.68,
        green: 0.82,
        blue: 1.0
    )

    let themes: [AppTheme] = [
        AppTheme(
            name: "Pastel Blue",
            color: Color(red: 0.68, green: 0.82, blue: 1.0)
        ),
        AppTheme(
            name: "Lavender",
            color: Color(red: 0.78, green: 0.70, blue: 1.0)
        ),
        AppTheme(
            name: "Sakura Pink",
            color: Color(red: 1.0, green: 0.75, blue: 0.85)
        ),
        AppTheme(
            name: "Mint Green",
            color: Color(red: 0.70, green: 0.95, blue: 0.80)
        ),
        AppTheme(
            name: "Peach",
            color: Color(red: 1.0, green: 0.85, blue: 0.65)
        ),
        AppTheme(
            name: "Butter Yellow",
            color: Color(red: 1.0, green: 0.95, blue: 0.70)
        ),
        AppTheme(
            name: "Pastel Cyan",
            color: Color(red: 0.70, green: 0.95, blue: 0.95)
        ),
        AppTheme(
            name: "Periwinkle",
            color: Color(red: 0.85, green: 0.75, blue: 0.95)
        ),
        AppTheme(
            name: "Soft Coral",
            color: Color(red: 1.0, green: 0.80, blue: 0.70)
        ),
        AppTheme(
            name: "Sage Green",
            color: Color(red: 0.80, green: 0.90, blue: 0.75)
        )
    ]

    init() {
        loadTheme()
    }

    func changeTheme(to theme: AppTheme) {
        selectedColor = theme.color
        selectedTheme = theme.name
    }

    private func loadTheme() {
        if let savedTheme = themes.first(where: { $0.name == selectedTheme }) {
            selectedColor = savedTheme.color
        }
    }
}

struct AppTheme: Identifiable {
    let id = UUID()
    let name: String
    let color: Color
}
