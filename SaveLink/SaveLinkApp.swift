//
//  SaveLinkApp.swift
//  SaveLink
//
//  Created by Juan Carlos Hernandez Castillo on 6/10/23.
//

import SwiftUI
import Firebase
import FacebookCore


class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)
        FirebaseApp.configure()
        
        return true
    }
}

@main
struct SaveLinkApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {
            if let _ = authenticationViewModel.user {
                HomeView(authenticationViewModel: authenticationViewModel)
            } else {
                AuthenticationView(authenticationViewModel: authenticationViewModel)
            }
        }
    }
}
