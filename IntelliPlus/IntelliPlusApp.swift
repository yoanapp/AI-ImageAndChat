//
//  IntelliPlusApp.swift
//  IntelliPlus
//
//  Created by user on 3/4/23.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions:
                     [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        return true
      }
    }


@main
struct IntelliPlusApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject var authenticationViewModel = AuthenticationViewModel()
    
    var body: some Scene {
        WindowGroup {

            if let _ = authenticationViewModel.user {
                Tabview()
            } else{
                LoginView(authenticationViewModel: authenticationViewModel)
            }
            
        }
    }
}
