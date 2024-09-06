//
//  SuppsTrackApp.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 16/08/2024.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
      FirebaseApp.configure()
      print("Firebase configured!")

    return true
  }
}

@main
struct SuppsTrackApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    var body: some Scene {
        WindowGroup {
           StartView()
        }
    }
}
