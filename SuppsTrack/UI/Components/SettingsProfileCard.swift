//
//  SettingsProfileCard.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 16/09/2024.
//

import SwiftUI

struct ProfileCard: View {
    var user: UserEntity
    
    var body: some View {
        ZStack {
            // Background rounded rectangle
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.blue.opacity(0.1))
                .frame(width: 370, height: 130)
            
            HStack(spacing: 20) {
                ZStack {
                    // Placeholder profile icon
                    Image(systemName: "person.circle")
                        .resizable()
                        .font(Font.title.weight(.ultraLight))
                        .scaledToFit()
                        .frame(width: 95, height: 95)
                        .clipShape(Circle())
                    
                    // Edit icon on top of profile icon
                    Image(systemName: "camera.circle.fill")
                        .resizable()
                        .font(Font.title.weight(.ultraLight))
                        .scaledToFit()
                        .frame(width: 20, height: 20)
                        .background()
                        .offset(x: 35, y: 20)
                }
                
                VStack(alignment: .leading) {
                    // Name
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                
                    // Edit info label
                    Text("Edit Info")
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
            }
            .padding()
            .frame(width: 370, height: 130)
        }
    }
}
