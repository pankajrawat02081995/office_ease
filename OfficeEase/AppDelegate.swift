//
//  AppDelegate.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import UIKit
import Firebase
import FirebaseMessaging
import UserNotifications

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    // MARK: - Application Lifecycle
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Firebase
        FirebaseApp.configure()
        
        // Request notification permissions
        requestNotificationPermissions(application)
        
        return true
    }
    
    // This method is called when the app successfully registers for remote notifications
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // Set the APNs device token to Firebase Messaging
        Messaging.messaging().apnsToken = deviceToken
    }
    
    // This method is called if registration fails
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Failed to register for remote notifications: \(error)")
    }
    
    // MARK: - Notifications
    private func requestNotificationPermissions(_ application: UIApplication) {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { granted, error in
            if granted {
                DispatchQueue.main.async {
                    application.registerForRemoteNotifications()
                }
            } else {
                print("Notification permission denied: \(String(describing: error?.localizedDescription))")
            }
        }
    }
}

// MARK: - Firebase and FCM Management (Extension)
extension AppDelegate {
    
    // Fetch FCM token asynchronously
    func getFCMToken() async throws -> String {
        return try await FCMTokenManager.shared.getFCMToken()
    }
    
    // Set up Firebase Messaging token and handle notifications
    func setupFirebaseMessaging() {
        // Set the UNUserNotificationCenter delegate to handle notifications when the app is in the foreground
        UNUserNotificationCenter.current().delegate = self
        
        // Request the FCM token when the app launches
        Task {
            do {
                let token = try await getFCMToken()
                print("FCM Token: \(token)")
            } catch {
                print("Error retrieving FCM token: \(error)")
            }
        }
    }
}

// MARK: - Notification Handling (Delegate)
extension AppDelegate: UNUserNotificationCenterDelegate {
    
    // Handle incoming notifications when the app is in the foreground
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive notification: UNNotification) {
        print("Received notification while app is in foreground: \(notification.request.content.userInfo)")
    }
    
    // Handle notifications when the app is in the background or terminated
    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        print("Received notification in background: \(userInfo)")
        completionHandler(.newData)
    }
}
