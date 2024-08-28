//
//  FirestoreAuthService.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Factory
import Foundation
import FirebaseAuth

class FirestoreAuthService: AuthService {
    
    @Injected(\.auth) private var auth
    
    var user: User? {
        auth.currentUser
    }
    
    var userEmail: String? {
        auth.currentUser?.email
    }
    
    var userId: String?
    
    static let shared = FirestoreAuthService()

    func createUser(email: String, password: String) async throws -> AuthDataEntity {
        let authDataResult = try await auth.createUser(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }

    func signInUser(email: String, password: String) async throws -> AuthDataEntity {
        let authDataResult = try await auth.signIn(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }

    func getAuthenticatedUser() throws -> AuthDataEntity {
        guard let user = auth.currentUser else {
            throw URLError(.badServerResponse)
        }

        return AuthDataEntity(user: user)
    }

    func isUserSignedIn() -> Bool {
        let authUser = try? FirestoreAuthService.shared.getAuthenticatedUser()

        if authUser != nil {
            print("User authenticated")
        } else {
            print("User not authenticated")
        }

        return authUser != nil
    }

    func signOut() throws {
        try auth.signOut()
    }
    
//    func updatePassword(_ password: String) -> AnyPublisher<Void, any Error> {
//        return
//    }
//    
//    func forgotPassword(email: String) -> AnyPublisher<Void, any Error> {
//        
//    }
}
