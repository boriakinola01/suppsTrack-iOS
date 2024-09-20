//
//  SuppsTrackApp.swift
//  SuppsTrack
//
//  Created by Bori Akinola on 16/08/2024.
//

import UIKit
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    var window: UIWindow?
    
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
      window = UIWindow()
          window?.backgroundColor = UIColor.grey_02 // Replace with your desired color
          window?.makeKeyAndVisible()
      
      FirebaseApp.configure()
      
      setUpAppearance()
      
      print("Firebase configured!")

    return true
  }
    
    private func setUpAppearance() {
        let appearance = UINavigationBarAppearance()
        
        let backChevron = UIImage(systemName: "chevron.left")?.withTintColor(.primary_b)
        
        appearance.backgroundColor = .primary_w
        appearance.setBackIndicatorImage(backChevron, transitionMaskImage: backChevron)
        
        UINavigationBar.appearance().tintColor = .blue_10
        
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
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
