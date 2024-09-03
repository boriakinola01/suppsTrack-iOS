//
//  SettingsViewModel.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Foundation

class SettingsViewModel: ObservableObject {
    private var subscriptions = Set<AnyCancellable>()

    @Published private(set) var user: UserEntity?

    @MainActor
    func loadCurrentUser() async throws {
        let authUser = try FirebaseAuthService.shared.getAuthenticatedUser()
        self.user = try await FirestoreUserService.shared.getUser(userId: authUser.uid)

        print(user!)
    }

    func addListenerForUserProfileUpdates() {
        guard let authUser = try? FirebaseAuthService.shared.getAuthenticatedUser() else { return }

        FirestoreUserService.shared.addListenerForUserProfileUpdates(userId: authUser.uid) { [weak self] userEntity in
            self?.user = userEntity
        }
    }

    func logOut() throws {
        try FirebaseAuthService.shared.signOut()
    }
}
