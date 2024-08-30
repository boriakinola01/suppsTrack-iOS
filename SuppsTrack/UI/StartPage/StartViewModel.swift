//
//  StartViewModel.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation

final class StartViewModel: ObservableObject {

    func isSignedIn() -> Bool {
        FirebaseAuthService.shared.isUserSignedIn()
    }
}
