//
//  SettingsProfileCard.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 16/09/2024.
//

import SwiftUI

struct ProfileCard: View {
    var user: UserEntity
    @Binding var showEditUserInfo: Bool
    
    var body: some View {
        ZStack {
            // Background rounded rectangle
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red_00)
                .frame(width: 370, height: 110)
            
            HStack(spacing: 20) {
                ZStack(alignment: .bottomTrailing) {
                    Group {
                        Image(systemName: "person.circle")
                            .resizable()
                    }
                    .font(Font.title.weight(.ultraLight))
                    .foregroundColor(.blue_10)
                    .clipShape(Circle())
                    .frame(width: 80, height: 75)
                    .padding(1)
                    .clipped()
                    
                    ZStack{
                        Circle()
                            .fill(Color.red_00)
                            .frame(width: 10, height: 10)
                        
                        Image(systemName: "camera.circle.fill")
                            .frame(width: 25, height: 25)
                            .foregroundColor(.B_08)
                            .shadow(color: .red_08, radius: 5)
                    }
                }
                
                VStack(alignment: .leading) {
                    // Name
                    Text("\(user.firstName) \(user.lastName)")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .foregroundColor(.blue_10)
                
                    // Edit info label
                    Text("Edit Info")
                        .font(.title3)
                        .foregroundColor(.blue_04)
                        .onTapGesture {
                            showEditUserInfo = true
                        }
                }
                Spacer()
            }

            .padding()
            .frame(width: 370, height: 110)
            .sheet(isPresented: $showEditUserInfo, content: {
                ProfileForm()
            })
        }
    }
}
