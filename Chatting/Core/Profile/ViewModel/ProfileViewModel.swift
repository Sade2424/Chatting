//
//  ProfileViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 16.04.2026.
//

import SwiftUI
import PhotosUI
internal import Combine

class ProfileViewModel: ObservableObject {
    @Published var selectedItem: PhotosPickerItem? {
        didSet {Task {try await loadImage()}}
        
    }
    
    @Published var profileImage: Image?
    
    func loadImage () async throws{
        guard let item = selectedItem else {return}
        guard let imageData = try await item.loadTransferable(type: Data.self) else {return}
        guard let uiImage = UIImage(data: imageData) else {return}
        self.profileImage = Image (uiImage: uiImage)
    }
}
