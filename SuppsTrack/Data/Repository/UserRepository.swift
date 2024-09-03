//
//  UserRepository.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Factory
import Foundation
import Combine
import FirebaseFirestore

struct UserRepository {
    @Injected(\.userService) private var userService
    @Injected(\.authService) private var authService
    
//    TODO: Complete this part first.
//    Getting this done would help with the profile viewmodel.
//    Accessing the user profile data would reuire some finctions from the user repository and the auth repostory too
    
    func getUser() async throws -> UserEntity? {
        guard let userId = authService.userId else {
            return nil
        }
        
        return try await userService.getUser(userId: userId)
    }
    
    func updateUser(user: UserEntity) {
    }
    
    func updatePassword(_ password: String) {
    }
    
    func uploadProfilePhoto(user: UserEntity, image: UIImage) {
    }
    
    func deleteProfilePhoto(user: UserEntity) {
    }
    
    func getProfilePhotoUrl(for user: UserEntity) {
    }
}
