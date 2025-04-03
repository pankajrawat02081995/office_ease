//
//  UITextField.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import UIKit

extension UITextField {
    
    /// Shakes the text field to indicate an error
    func shake(duration: CFTimeInterval = 0.5, repeatCount: Float = 3, amplitude: CGFloat = 5) {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = duration / Double(repeatCount * 2)
        animation.repeatCount = repeatCount
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - amplitude, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + amplitude, y: self.center.y))
        layer.add(animation, forKey: "position")
    }
    
    /// Shows an error border around the text field
    func showError(borderColor: UIColor = .red, borderWidth: CGFloat = 1.5, cornerRadius: CGFloat = 8.0) {
        layer.borderColor = borderColor.cgColor
        layer.borderWidth = borderWidth
        layer.cornerRadius = cornerRadius
    }
    
    /// Removes the error border
    func clearError() {
        layer.borderColor = UIColor.clear.cgColor
        layer.borderWidth = 0
    }
}
