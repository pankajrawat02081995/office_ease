//
//  String.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation

extension String {
    
    func formattedPhoneNumber() -> String {
        // Remove all non-numeric characters
        let digits = self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
        
        // Check if already formatted
        if self == digits {
            return applyPhoneNumberFormat(to: digits) // Apply formatting if unformatted
        } else {
            return digits // Return unformatted number if already formatted
        }
    }
    
    private func applyPhoneNumberFormat(to number: String) -> String {
        let maxLength = 10 // Adjust based on your requirement
        
        let trimmed = String(number.prefix(maxLength)) // Ensure max length is not exceeded
        
        var formatted = ""
        let mask = "(XXX) XXX-XXXX" // Change format if needed
        var index = trimmed.startIndex
        
        for char in mask where index < trimmed.endIndex {
            if char == "X" {
                formatted.append(trimmed[index])
                index = trimmed.index(after: index)
            } else {
                formatted.append(char)
            }
        }
        
        return formatted
    }
}
