//
//  UIViewController.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import UIKit

enum StoryboardName: String {
    case main = "Main"
}

extension UIViewController{
    
    func applyGradient(firstColorEndRatio:Double=0.5){
        self.view.applyGradient(fromColor: .themeColor, toColor: .white, firstColorEndRatio: firstColorEndRatio)
    }
    
    /// Instantiates and pushes a view controller from a storyboard
    func pushViewController<T: UIViewController>(
        ofType type: T.Type,
        fromStoryboard storyboardName: StoryboardName,
        animated: Bool = true,
        configure: ((T) -> Void)? = nil
    ) {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: String(describing: type)) as? T else {
            print("❌ Error: ViewController \(type) not found in storyboard \(storyboardName)")
            return
        }
        
        configure?(viewController) // Configure if needed
        navigationController?.pushViewController(viewController, animated: animated)
    }
    
    static func instantiate(fromStoryboard storyboardName: StoryboardName = .main) -> Self {
        let storyboard = UIStoryboard(name: storyboardName.rawValue, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: String(describing: self)) as! Self
    }
}
