//
//  AuthEntity.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation
import FirebaseAuth

struct AuthDataEntity {
    var id: String
    
    var email: String?
    var photoUrl: String?

    init(user: User) {
        self.id = user.uid
        self.email = user.email
        self.photoUrl = user.photoURL?.absoluteString
    }
}
