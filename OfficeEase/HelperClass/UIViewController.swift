//
//  UIViewController.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import UIKit

extension UIViewController{
    func applyGradient(firstColorEndRatio:Double=0.5){
        self.view.applyGradient(fromColor: .themeColor, toColor: .white, firstColorEndRatio: firstColorEndRatio)
    }
}
