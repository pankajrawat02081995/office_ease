//
//  UIFont.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation
import UIKit

extension UIFont {
    /// Predefined fonts with specific sizes
    static let titleFont = UIFont.customFont(name: "Helvetica-Bold", size: 24)
    static let bodyFont = UIFont.customFont(name: "Helvetica", size: 16)
    static let captionFont = UIFont.customFont(name: "Helvetica-Light", size: 12)

    /// A function to load custom fonts safely with a default fallback
    static func customFont(name: String, size: CGFloat) -> UIFont {
        return UIFont(name: name, size: size) ?? UIFont.systemFont(ofSize: size)
    }
}
