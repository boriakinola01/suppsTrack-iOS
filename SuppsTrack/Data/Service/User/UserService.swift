//
//  UserService.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Foundation
import FirebaseFirestore

protocol UserService {
    
//    var activeUserIdPublisher: AnyPublisher<String?, Never> { get set }
    
    func getUserDocument(userId: String) -> DocumentReference
    
    func createNewUser(user: UserEntity) async throws
    
    func getUser(userId: String) async throws -> UserEntity
    
    func addListenerForUserProfileUpdates(userId: String, completion: @escaping (_ userEntity: UserEntity) -> Void)
    
    func getUser(userId: String) -> AnyPublisher<UserEntity, Error>
}
