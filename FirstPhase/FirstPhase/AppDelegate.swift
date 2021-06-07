//
//  AppDelegate.swift
//  FirstPhase
//
//  Created by Keisuke Horiguchi on 2021/05/18.
//

import Foundation
import Firebase


class AppDelegate: NSObject, UIApplicationDelegate {
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        
        if UserDefaults.standard.integer(forKey: Key().countKey) == 0 {
            
            let newUser = User(id: UUID(), name: "", icon: "", profile: "")
            let userViewModel = UserViewModel()
            
            UserDefaults.standard.set(newUser.id.uuidString, forKey: Key().userKey)
            userViewModel.addUser(userId: newUser.id)
            
        } else if UserDefaults.standard.integer(forKey: Key().countKey) == 20 {
            
        }
        UserDefaults.standard.set(UserDefaults.standard.integer(forKey: Key().countKey) + 1, forKey: Key().countKey)

        return true
    }
}
