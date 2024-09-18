//
//  ProfileFormViewModel.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import Combine
import Factory
import SwiftUI
import Foundation

class ProfileFormViewModel: ObservableObject {
    @Published var newProfilePhoto: UIImage?
    @Published var profilePhotoRemoved: Bool = false
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var dateOfBirth: Date?
    @Published var heightMetres: Double = 0.0
    @Published var weightKg: Double = 0.0
}
