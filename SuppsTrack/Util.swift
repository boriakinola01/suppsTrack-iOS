//
//  Util.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 22/08/2024.
//

import Foundation
import SwiftUI

/*
    Enums
 */

enum DatabaseError: Error {
    case databaseNotReacheable
    case documentNotFound
    case documentNotSerialized
}

enum UserDefault: String, CaseIterable {
    case activeUserIdKey = "activeUserIdKey"
}

enum NavigationBarItem {
    static var empty: some View {
        EmptyView()
    }

    static var homeText: some View {
        Text("Home Page")
            .scaledToFit()
    }

    static var profilePhoto: some View {
        ProfilePhoto()
    }

    static func close() -> some View {
        Button(
            action: {print("Button pressed!!!")},
            label: {
                Image("back")
            }
        )
    }

}

enum Gender: String, Codable, CaseIterable {
    case male = "Male"
    case female = "Female"
    case preferNotSay = "Prefer Not Say"
    
}

extension UserDefaults {
    @objc var activeUserId: String? {
        get {
            guard let id = self.object(forKey: UserDefault.activeUserIdKey.rawValue) as? String
                else { return nil }

            return id
        }

        set {
            if newValue == nil {
                self.removeObject(forKey: UserDefault.activeUserIdKey.rawValue)
            } else {
                set(newValue, forKey: UserDefault.activeUserIdKey.rawValue)
            }
        }
    }
}



extension View {

    @ViewBuilder
    func navigationHomeScreeView(title: String? = nil, showSignInView: Bool) -> some View {
        self.modifier(NavigationHomeScreenViewModifier(title: title))
    }
}

struct NavigationHomeScreenViewModifier: ViewModifier {

    var title: String?

    func body(content: Content) -> some View {
        NavigationView {
            content
                .navigationTitle(title ?? "")
                .toolbar {
                    toolbarItems(
                        leadingItem: NavigationBarItem.empty,
                        centerItem: NavigationBarItem.homeText,
                        trailingItem: NavigationBarItem.profilePhoto)
                }
        }
    }

}

@ToolbarContentBuilder
func toolbarItems<L: View, C: View, T: View>(leadingItem: L, centerItem: C, trailingItem: T) -> some ToolbarContent {

    ToolbarItem(placement: .navigationBarLeading) {
        leadingItem
    }

    ToolbarItem(placement: .principal) {
        centerItem
    }

    ToolbarItem(placement: .navigationBarTrailing) {
        trailingItem
    }
}

struct ProfilePhoto: View {

    @EnvironmentObject var startViewModel: StartViewModel

    var body: some View {

        ZStack {
                Image(systemName: "person.circle")
                .resizable()
                .frame(width: 32, height: 32)
                .accentColor(.blue)
                .opacity(1)
            }

    }
}
