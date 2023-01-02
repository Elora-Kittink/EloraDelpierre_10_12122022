//
//  AppDelegate.swift
//  Reciplease
//
//  Created by Elora on 12/12/2022.
//

import UIKit
import CoreDataUtilsKit
import UtilsKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // Override point for customization after application launch.
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
                let documentsDirectory = paths.first
            log(.data, "Documents directory: \(documentsDirectory?.absoluteString ?? ":danger: No documents directory file !")")
        do {
           try CoreDataManager.default.setCoreDataStack("Reciplease")
            log(.data, "core data succes")
        } catch {
            log(.data, "fail core data init", error: error)
        }
        return true
    }

    // MARK: UISceneSession Lifecycle
    func application(_ application: UIApplication,
                     configurationForConnecting connectingSceneSession: UISceneSession,
                     options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    
}
