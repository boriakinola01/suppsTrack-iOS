//
//  Components.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import Foundation
import SwiftUI

/*
    TextFieldInput:
        Basically a textfield that handles user input. Multiple of these would be used inside a form for example.
 */

struct TextInputField: View {
    @Binding var value: String

    var label: String

    var placeholderText: String = ""

    var isOptional: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                Text(label)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.leading)

                if isOptional {
                    Text("(Optional)")
                        .foregroundColor(.gray)
                        .opacity(0.6)
                }
                
                Spacer()
            }
            

            TextField(placeholderText, text: $value)
                .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.black, lineWidth: 2)
                )
        }
        .padding()
    }
}

/*
    DatePicker:
        An input for editing the date values
 */

struct DateInputField: View {
    @State var date = Date()
    
    var label: String
    
    var body: some View {
        DatePicker(label, selection: $date)
    }
}


struct ListItem: View {
    var iconName: String? = nil
    var label: String
    var clickable: Bool
    
    var body: some View {
        HStack {
            if let iconName = iconName {
                Image(systemName: iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 30, height: 30)
                    .foregroundColor(.red_10)
                    .padding(.trailing, 5)
            }
           
            Text(label)
                .font(.headline)
                .foregroundColor(Color.primary_b)
            
            Spacer()
            
            if clickable {
                Image(systemName: "chevron.right")
                    .foregroundColor(.red_04)
            }
        }
        .padding()
    }
}
