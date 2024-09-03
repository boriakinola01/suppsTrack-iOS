//
//  MainView.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import SwiftUI

struct MainView: View {

    @StateObject private var viewModel = MainViewModel()
    @Binding var showSignInView: Bool

    var body: some View {
        ZStack {

            Text("Hi there!")

            Spacer()

        }
        .onAppear()
        .toolbar {

            ToolbarItem(placement: .principal) {
                Text("Home Page")
                    .scaledToFit()
            }

            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    ProfileForm(showSignInView: $showSignInView)
//                    SettingsView(showSignInView: $showSignInView)
                } label: {
                    ProfilePhoto()
                }
            }
        }
        // .navigationHomeScreeView(title: "Welcome ", showSignInView: showSignInView)
    }
}
