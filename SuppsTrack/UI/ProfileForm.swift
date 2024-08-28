//
//  ProfileForm.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import SwiftUI

struct ProfileForm: View {
    
    @StateObject var viewModel: ProfileFormViewModel
    @State private var didAppear: Bool = false
    @Binding var showSignInView: Bool
    
    var body: some View {
        ZStack {

            ScrollView(showsIndicators: false) {
                profileHeader()
                
                profileValuesEdit()
                
                Button("Log out") {
                    Task {
                        do {
                            try viewModel.logOut()
                            showSignInView = true
                        } catch {
                            print(error)
                        }
                    }
                    print("Logged out.......")
                }
                .font(.headline)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .frame(height: 60)
                .background(Color.blue)
                .cornerRadius(10)
            }
        }
    }

    /*
        Profile Header
     */

    func profileHeader() -> some View {
        VStack(alignment: .center) {
            ZStack(
                alignment: .bottomTrailing
            ) {
                Group {
                        Image("EmptyProfile").resizable().aspectRatio(contentMode: .fill)
                }
                .clipShape(Circle())
                .frame(width: 80, height: 80)
                .padding(1)
                .clipped()
                
                Image("camera")
                    .frame(width: 25, height: 25)
                    .clipShape(Circle())
            }
        }
    }
    
    
    /*
        Profile Values Edit
     */
    
    func profileValuesEdit() -> some View {
        
        Section {
            // First name
            TextInputField(
                value: $viewModel.firstName,
                label: "First Name",
                placeholderText: "Your first name",
                isOptional: false)
            
            // Last name
            TextInputField(
                value: $viewModel.lastName,
                label: "Last Name",
                placeholderText: "Your last name",
                isOptional: false)
            
            // Gender
            
            
            // Date of Birth
        }
        .onAppear {
            if !didAppear {
                didAppear = true
            }
        }
        
        
    }

}
