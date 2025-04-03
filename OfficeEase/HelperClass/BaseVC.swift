//
//  BaseVC.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import UIKit

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
    }
    
    // MARK: - Navigation Bar Setup
    func setupNavigationBar() {
        guard let navigationController = navigationController else {
            print("⚠️ Warning: This view controller is not inside a navigation controller.")
            return
        }
        
        navigationController.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController.navigationBar.tintColor = .systemBlue // Customize color
        
        // Back button setup (only if not the root VC)
        if navigationController.viewControllers.count > 1 {
            setupBackButton()
        }
    }
    
    // MARK: - Back Button Configuration
    private func setupBackButton() {
        guard let backImage = UIImage(named: "ic_back")?.withRenderingMode(.alwaysOriginal) else {
            print("❌ Error: 'ic_back' image not found!")
            return
        }
        
        let backButton = UIBarButtonItem(image: backImage,
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    // MARK: - Back Button Action
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    
    // MARK: - Set Title (Common Method)
    func setNavigationTitle(_ title: String) {
        navigationItem.title = title
    }
}
