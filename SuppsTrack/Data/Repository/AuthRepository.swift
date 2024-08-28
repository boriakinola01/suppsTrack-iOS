//
//  AuthRepository.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Factory
import Foundation
import FirebaseAuth

struct AuthRepository {

    @Injected(\.authService) private var authService

    var userId: String? {
        authService.userId
    }

    var userEmail: String? {
        authService.userEmail
    }
    
    var isUserSignedIn: Bool {
        return authService.isUserSignedIn()
    }
    
    func logOut() throws {
        try authService.signOut()
    }
    
    func getAuthenticatedUser() async throws -> UserEntity {
        let authUser = try authService.getAuthenticatedUser()
        return try await authService.getUser(userId: authUser.id)
    }
    
    

}
