//
//  UIView.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation
import UIKit

extension UIView {
    /// Apply a gradient with a customizable transition ratio
    func applyGradient(fromColor: UIColor, toColor: UIColor, firstColorEndRatio: CGFloat = 0.25) {
        let gradientLayerName = "GradientLayer"
        
        // Remove existing gradient layer if present
        layer.sublayers?.removeAll(where: { $0.name == gradientLayerName })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.name = gradientLayerName
        gradientLayer.frame = bounds
        gradientLayer.colors = [fromColor.cgColor, toColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0.5, y: 0.0)  // Top
        gradientLayer.endPoint = CGPoint(x: 0.5, y: 1.0)    // Bottom
        gradientLayer.cornerRadius = layer.cornerRadius
        
        // Ensure ratio stays between 0.0 and 1.0
        let adjustedRatio = min(max(firstColorEndRatio, 0.0), 1.0)
        
        // First color ends at the specified ratio
        gradientLayer.locations = [0.0, NSNumber(value: adjustedRatio), 1.0]

        layer.insertSublayer(gradientLayer, at: 0)
    }
}


