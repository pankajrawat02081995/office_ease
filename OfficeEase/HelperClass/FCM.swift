//
//  FCM.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 09/04/25.
//

import Foundation
import FirebaseMessaging

// Actor to safely manage FCM token retrieval
actor FCMTokenManager {
    
    static let shared = FCMTokenManager() // Singleton instance for shared access
    
    private var currentToken: String?
    
    // Fetch the FCM token asynchronously and cache it
    func getFCMToken() async throws -> String {
        // If the token is cached, return it
        if let cachedToken = currentToken {
            return cachedToken
        }
        
        // Otherwise, fetch the token from Firebase
        let token = try await fetchTokenFromFirebase()
        currentToken = token  // Cache the token
        return token
    }
    
    // Fetch the FCM token from Firebase
    private func fetchTokenFromFirebase() async throws -> String {
        return try await withCheckedThrowingContinuation { continuation in
            Messaging.messaging().token { token, error in
                if let error = error {
                    continuation.resume(throwing: error)
                } else if let token = token {
                    continuation.resume(returning: token)
                }
            }
        }
    }
}
