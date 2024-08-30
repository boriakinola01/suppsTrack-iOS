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
    
//    func signIn(email: String, password: String) -> AnyPublisher<MultiFactorResolver?, Error> {
//        authService.signIn(email: email, password: password)
//    }
    
    func logOut() throws {
        try authService.signOut()
    }
    
    func getAuthenticatedUser() async throws -> User {
        let authUser = try authService.getAuthenticatedUser()
        return authUser
    }
    

}
