//
//  FirestoreUserService.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Combine
import Factory
import Foundation
import FirebaseFirestore

class FirestoreUserService: UserService {

    @Injected(\.userDefaults) internal var userDefaults

    static let shared = FirestoreUserService()

//    lazy var activeUserIdPublisher: AnyPublisher<String?, Never> = {
//        userDefaults.publisher(for: \.activeUserId)
//            .removeDuplicates()
//            .eraseToAnyPublisher()
//    }()

    func getUserDocument(userId: String) -> DocumentReference {
        Firestore.firestore().collection(Constant.Firestore.Collection.user).document(userId)
    }

    func createNewUser(user: UserEntity) async throws {
        _ = try getUserDocument(userId: user.id)
            .setData(from: user, merge: false)
    }

    func getUser(userId: String) async throws -> UserEntity {
        try await getUserDocument(userId: userId).getDocument(as: UserEntity.self)
    }

    func addListenerForUserProfileUpdates(userId: String, completion: @escaping (_ userEntity: UserEntity) -> Void) {
        getUserDocument(userId: userId).addSnapshotListener { querySnapshot, error in

            guard let document = querySnapshot else {
                print("No documents")
                return
            }

            do {
                let userEntity: UserEntity = try document.data(as: UserEntity.self)
                completion(userEntity)
            } catch {
                print("Failed to decode document to UserEntity: \(error)")
            }
        }
    }

    func getUser(userId: String) -> AnyPublisher<UserEntity, Error> {
        return Future { [unowned self] promise in
            getUserDocument(userId: userId).getDocument { documentSnapshot, error in
                if let error {
                    print("Document was not fetched from database")
                    print(error)
                    promise(.failure(DatabaseError.databaseNotReacheable))
                } else if let document = documentSnapshot, document.exists {
                    do {
                        let userEntity: UserEntity = try document.data(as: UserEntity.self)
                        promise(.success(userEntity))
                    } catch {
                        print("Object serialization failed")
                        promise(.failure(DatabaseError.documentNotSerialized))
                    }
                } else {
                    promise(.failure(DatabaseError.documentNotFound))
                }
            }
        }
        .eraseToAnyPublisher()
    }
}
