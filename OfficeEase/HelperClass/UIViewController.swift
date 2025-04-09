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

private var LeftButtonActionKey: UInt8 = 0
private var RightButtonActionKey: UInt8 = 0

extension UIViewController{
    
    // Method to setup a custom navigation bar
    func setupCustomNavigationBar(leftImage: UIImage?,
                                  leftAction: (() -> Void)? = nil,
                                  rightImage: UIImage?,
                                  rightAction: (() -> Void)? = nil) {
        
        // Left Button Setup
        if let leftImage = leftImage {
            let leftButton = UIButton(type: .custom)
            leftButton.setImage(leftImage, for: .normal)
            leftButton.addTarget(self, action: #selector(handleLeftButton), for: .touchUpInside)
            leftButton.tag = 1  // Tag to identify the left button
            let leftBarButton = UIBarButtonItem(customView: leftButton)
            navigationItem.leftBarButtonItem = leftBarButton
            
            // Store the left button callback using associated object
            objc_setAssociatedObject(self, &LeftButtonActionKey, leftAction, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        } else {
            // Default back button if no image is provided
            let leftBarButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(backButtonAction))
            navigationItem.leftBarButtonItem = leftBarButton
        }
        
        // Right Button Setup
        if let rightImage = rightImage {
            let rightButton = UIButton(type: .custom)
            rightButton.setImage(rightImage, for: .normal)
            rightButton.layer.cornerRadius = rightButton.frame.size.width / 2
            rightButton.layer.masksToBounds = true
            rightButton.addTarget(self, action: #selector(handleRightButton), for: .touchUpInside)
            let rightBarButton = UIBarButtonItem(customView: rightButton)
            navigationItem.rightBarButtonItem = rightBarButton
            
            // Store the right button callback using associated object
            objc_setAssociatedObject(self, &RightButtonActionKey, rightAction, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    // Callback for Left Button
    @objc private func handleLeftButton() {
        // Retrieve the left button action and call it if available
        if let action = objc_getAssociatedObject(self, &LeftButtonActionKey) as? (() -> Void) {
            action()
        }
    }
    
    // Callback for Right Button
    @objc private func handleRightButton() {
        // Retrieve the right button action and call it if available
        if let action = objc_getAssociatedObject(self, &RightButtonActionKey) as? (() -> Void) {
            action()
        }
    }
    
    // Default back button action (optional)
    @objc private func backButtonAction() {
        navigationController?.popViewController(animated: true)
    }
    
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
