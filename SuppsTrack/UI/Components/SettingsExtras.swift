//
//  SettingsExtrasSection.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 18/09/2024.
//

import SwiftUI

struct SettingsExtrasSection: View {
    var body: some View {
            ZStack {
               RoundedRectangle(cornerRadius: 20)
                    .fill(Color.red_00)
                   .frame(width: 370)
               
               VStack {
                   ListItem(iconName: "doc.fill.badge.plus", label: "Give some feedback", clickable: true)
                   
                   Divider().padding([.leading, .trailing], 10)
                   
                   ListItem(iconName: "lock.rotation", label: "Change password", clickable: true)
                   
                   Divider().padding([.leading, .trailing], 10)
                   
                   ListItem(iconName: "list.bullet.clipboard.fill", label: "Privacy policy", clickable: true)
                   
                   Divider().padding([.leading, .trailing], 10)
                   
                   ListItem(iconName: "info.circle.fill", label: "About", clickable: true)
               }
               .frame(width: 370)
               .padding(5)
        }
    }
}
