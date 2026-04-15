//
//  SettingsOptionsViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 15.04.2026.
//

import Foundation
enum SettingsOptionsViewModel: Int, CaseIterable, Identifiable {
    case darkMode
    case activeStatus
    case accesibility
    case privacy
    case notifications
    
    var title: String {
        switch self {
        case .darkMode: return "Dark mode"
        case .activeStatus: return "Active status"
        case .accesibility: return "Accesibility"
        case .privacy: return "Privacy and Safety"
        case .notifications: return "Notifications"
        }
    }
    
    var imageName: String (
        switch self {
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notifications: return "bell.circle.fill"
        }
    }
        
        var imageBackgroundColor: Color {
            switch self {
            case .darkMode: return Color.theme.primaryText
            case .activeStatus: return Color(.systemGreen
            case .accessibility: return Color.theme.primaryText
            case .privacy: return Color(.systemBlue)
            case .notifications: return Color(.systemPurple)
    }
    var id: Int {return self.rawValue}
}
