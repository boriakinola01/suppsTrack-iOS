//
//  SettingsAppSection.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 18/09/2024.
//

import SwiftUI

struct SettingsAppSection: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.red_00)
                .frame(width: 370)
            
            VStack {
                ListItem(iconName: "capsule.lefthalf.filled", label: "Supplements", clickable: true)
                
                Divider().padding([.leading, .trailing], 10)
                
                ListItem(iconName: "clock", label: "Intake History", clickable: true)
                
                Divider().padding([.leading, .trailing], 10)
                
                ListItem(iconName: "square.and.arrow.up", label: "Export", clickable: true)
            }
            .frame(width: 370)
            .padding(5)
        }
    }
}
