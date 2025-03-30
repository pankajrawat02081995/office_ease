//
//  UIColor.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation
import UIKit

extension UIColor {
    // Define custom colors
    static let themeColor = UIColor(named: "ThemeColor") ?? UIColor()
    
    // Convenience initializer to create UIColor from Hex
    convenience init(hex: String, alpha: CGFloat = 1.0) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb >> 16) & 0xFF) / 255.0
        let green = CGFloat((rgb >> 8) & 0xFF) / 255.0
        let blue = CGFloat(rgb & 0xFF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: alpha)
    }
}
