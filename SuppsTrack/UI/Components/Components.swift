//
//  Components.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 26/08/2024.
//

import Foundation
import SwiftUI


/*
    Form Label: Label for each field in the form.
    Also indicates if the field is optional or not
 */
struct FormLabel: View {

    var label: String

    var isOptional: Bool?

    var body: some View {
        HStack {

            Text(label)
                .foregroundColor(.gray)

            if let isOptional = isOptional, isOptional {
                Text("Optional")
                    .foregroundColor(.gray)
            }
        }
    }
}

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
        
        FormLabel(label: label, isOptional: isOptional)

        TextField(placeholderText, text: $value)
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
