//
//  LoginView.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import SwiftUI

struct LoginView: View {
    @StateObject private var viewModel = LoginViewModel()
    @Binding var showSignInView: Bool

    @State private var navigationLink: NavigationLinks?

    private enum NavigationLinks: Int {
        case homeStraight
    }

    var body: some View {
        NavigationView {
            VStack {
                TextField("Email...", text: $viewModel.email)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                SecureField("Password...", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .cornerRadius(10)

                Button {
                    viewModel.signIn()
                    showSignInView = false
                } label: {
                    Text("Sign in")
                        .font(.headline)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 60)
                        .background(Color.blue)
                        .cornerRadius(10)
                }

                Spacer()
            }
            .padding()
            .navigationTitle("Sign in")
        }
    }
}
