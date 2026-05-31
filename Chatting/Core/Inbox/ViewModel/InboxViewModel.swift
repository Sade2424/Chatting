//
//  InboxViewModel.swift
//  Chatting
//
//  Created by Sade El Moudden on 31.05.2026.
//

import Foundation
internal import Combine
import Firebase


class InboxViewModel: ObservableObject {
    @Published var currentUser: User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        setupSubscribers()
    }
    
    private func setupSubscribers() {
        UserService.shared.$currentUser.sink { [weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
