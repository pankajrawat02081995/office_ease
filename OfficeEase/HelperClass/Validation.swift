//
//  Validation.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import Foundation

extension String {
    
    /// Validates if the string is a valid email format
    var isValidEmail: Bool {
        let emailRegex = #"^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$"#
        return NSPredicate(format: "SELF MATCHES %@", emailRegex).evaluate(with: self)
    }

    /// Validates if the string is a valid phone number (Supports 10-15 digits)
    var isValidPhoneNumber: Bool {
        let phoneRegex = #"^\d{10,15}$"#
        return NSPredicate(format: "SELF MATCHES %@", phoneRegex).evaluate(with: self)
    }
    
    /// Validates if the string is a valid username (alphanumeric, 3-20 characters)
    var isValidUsername: Bool {
        let usernameRegex = #"^[a-zA-Z0-9_]{3,20}$"#
        return NSPredicate(format: "SELF MATCHES %@", usernameRegex).evaluate(with: self)
    }
}
