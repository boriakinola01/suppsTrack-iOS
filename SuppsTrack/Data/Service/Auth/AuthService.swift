//
//  AuthService.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Foundation
import FirebaseAuth

protocol AuthService {
    
    var user: User? { get }
    
    var userEmail: String? { get }
 
    var userId: String? { get }
    
    func createUser(email: String, password: String) async throws -> AuthDataEntity

    func signInUser(email: String, password: String) async throws -> AuthDataEntity

    func getAuthenticatedUser() throws -> AuthDataEntity

    func isUserSignedIn() -> Bool
    
//    func updatePassword(_ password: String) -> AnyPublisher<Void, Error>
//    
//    func forgotPassword(email: String) -> AnyPublisher<Void, Error>

    func signOut() throws
    
}
