//
//  ProfileForm.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import SwiftUI

struct ProfileForm: View {
    @StateObject var viewModel = ProfileFormViewModel()
    
    var body: some View {
        ZStack {
            ScrollView {
                TextInputField(value: $viewModel.firstName, label: "First Name")
                
                TextInputField(value: $viewModel.lastName, label: "Last Name")
            }
        }
    }

    /*
        Profile Header
     */
    
    /*
        Profile Values Edit
     */
}
