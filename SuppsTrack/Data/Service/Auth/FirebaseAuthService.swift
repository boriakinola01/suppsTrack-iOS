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

class FirebaseAuthService: AuthService {
    @Injected(\.auth) private var auth
    
    var user: User? {
        auth.currentUser
    }
    
    var userEmail: String? {
        auth.currentUser?.email
    }
    
    var userId: String? {
        auth.currentUser?.uid
    }
    
    static let shared = FirebaseAuthService()

    func createUser(email: String, password: String) async throws -> AuthDataEntity {
        let authDataResult = try await auth.createUser(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }
    
    func signIn(email: String, password: String) -> AnyPublisher<MultiFactorResolver?, Error> {
        return Future { [weak self] promise in
            self?.auth.signIn(withEmail: email, password: password) { _, error in
                if let error {
                    print(error)
                } else {
                    promise(.success(nil))
                }
            }
        }
        .eraseToAnyPublisher()
    }

    func signInUser(email: String, password: String) async throws -> AuthDataEntity {
        let authDataResult = try await auth.signIn(withEmail: email, password: password)
        return  AuthDataEntity(user: authDataResult.user)
    }

    func getAuthenticatedUser() throws -> User {
        guard let user = auth.currentUser else {
            throw URLError(.badServerResponse)
        }
        
        return user
    }

    func isUserSignedIn() -> Bool {
        auth.currentUser != nil
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
