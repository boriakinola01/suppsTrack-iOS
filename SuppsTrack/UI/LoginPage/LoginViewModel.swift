//
//  LoginViewModel.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation

final class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var showSignInView: Bool = true

    /*
        Signing in a user
     */
    func signIn() {

//      Include some validation for email and passwowrd authentications here
//
        guard !email.isEmpty, !password.isEmpty else {
            print("No email or passowrd found.")
            return
        }

        Task {
            do {
                let returnedUserData =
                    try await FirebaseAuthService.shared.signInUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
            } catch {
                print("Error: \(error)")
            }
        }
    }

    /*
        Signing up a user
     */

    func signUp() async throws {

        guard !email.isEmpty, !password.isEmpty else {
            print("No email or passowrd found.")
            return
        }
        //        try await UserManager.shared.createNewUser(auth: returnedUserData)

        Task {
            do {
                let returnedUserData = try await FirebaseAuthService.shared.createUser(email: email, password: password)
                print("Success")
                print(returnedUserData)
                return true
            } catch {
                print("Error: \(error)")
                return false
            }
        }
    }

}
