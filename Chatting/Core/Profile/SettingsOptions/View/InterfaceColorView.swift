//
//  InterfaceColorView.swift
//  Chatting
//
//  Created by Sade El Moudden on 13.07.2026.
//

import Foundation
import SwiftUI


struct InterfaceColorView: View {
    
    @EnvironmentObject var themeManager: ThemeManager

    
    var body: some View {
        VStack(spacing: 30) {
            
            Text("Choose your interface color")
                .font(.headline)
            
            HStack(spacing: 20) {
                ForEach(themeManager.themes) { theme in

                    Button {
                        themeManager.changeTheme(to: theme)
                    } label: {
                        Circle()
                            .fill(theme.color)
                            .frame(width: 45, height: 45)
                    }
                }
            }
        }
        .navigationTitle("Interface Color")
    }
}
