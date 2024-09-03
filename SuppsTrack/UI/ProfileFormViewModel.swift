//
//  ProfileFormViewModel.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import Combine
import Factory
import Foundation

class ProfileFormViewModel: ObservableObject {
    @Injected(\.authRepo) private var authRepo
    @Injected(\.userRepo) private var userRepo
    
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var gender: Gender?
    @Published var dateOfBirth: Date?
    
    @MainActor
    func loadCurrentUser() async throws {
        if let userEntity = try await userRepo.getUser() {
            firstName = userEntity.firstName
        }
    }
    
    func logOut() throws {
        try authRepo.logOut()
    }
}
