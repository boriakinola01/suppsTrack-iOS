//
//  DI+Others.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation
import Factory
import Firebase
import FirebaseAuth
import FirebaseFirestore

extension Container {
    
    var userDefaults: Factory<UserDefaults> {
        Factory(self) { UserDefaults.standard }.singleton
    }

    /*
        Repositories
     */
    
    var authRepo: Factory<AuthRepository> {
        Factory(self) { AuthRepository() }.singleton
    }

    
    
    var userRepo: Factory<UserRepository> {
        Factory(self) { UserRepository() }.singleton
    }

    
    
    /*
        Services
     */
    
    var authService: Factory<AuthService> {
        Factory(self) { FirebaseAuthService() }.singleton
    }
    
    var userService: Factory<UserService> {
        Factory(self) { FirestoreUserService() }.singleton
    }
    
    
    
    /*
        Firestore, Firebase
     */
    var auth: Factory<Auth> {
        Factory(self) { Auth.auth() }.singleton
    }
}
