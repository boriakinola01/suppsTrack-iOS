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
        }
    }
}

/*
    GenderInputField:
        An iput field for users to update their gender you see
 */

struct GenderInputField: View {
    @Binding var gender: Gender?
    
    var label: String
    
    private var showPlaceholder: Bool {
        gender == nil
    }
    
    var body: some View {
        Text("Hi there")
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
