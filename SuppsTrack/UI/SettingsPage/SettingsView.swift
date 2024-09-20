//
//  SettingsView.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()
    @State private var showEditUserInfo = false
    @State private var didAppear: Bool = false
    @Binding var showSignInView: Bool
    
    var body: some View {
        ScrollView {
            if let user = viewModel.user {
                ProfileCard(user: user, showEditUserInfo: $showEditUserInfo)
            }
            
            Spacer()
                .frame(height: 45)
            
            SettingsAppSection()
            
            Spacer()
                .frame(height: 45)
            
            SettingsExtrasSection()
            
            Spacer()
                .frame(height: 45)
            
            
            Button(action: {
                Task {
                    do {
                        try viewModel.logOut()
                        showSignInView = true
                    } catch {
                        print(error)
                    }
                }
                print("Logged out.......")
            }) {
                Text("Log out")
                    .fontWeight(.bold)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue_08)
                    .foregroundColor(Color.primary_w)
                    .cornerRadius(20)
                    .padding(.horizontal, 100)
            }
            .shadow(radius: 5)
        }
        .toolbar {
            toolbarItems(
                leadingItem: EmptyView(),
                centerItem: Text("Settings"),
                trailingItem: EmptyView()
            )
        }
        .onAppear {
            if !didAppear {
                viewModel.addListenerForUserProfileUpdates()
                didAppear = true
            }
        }
    }
}
