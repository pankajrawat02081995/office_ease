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
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .automatic
        navigationController?.navigationBar.tintColor = .systemBlue // Customize color
        
        // Back button setup (only if not the root VC)
        if navigationController?.viewControllers.count ?? 0 > 1 {
            setupBackButton()
        }
    }
    
    // MARK: - Back Button Configuration
    private func setupBackButton() {
        let backButton = UIBarButtonItem(image: UIImage(systemName: "chevron.left"),
                                         style: .plain,
                                         target: self,
                                         action: #selector(backButtonTapped))
        navigationItem.leftBarButtonItem = backButton
    }
    
    @objc private func backButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Set Title (Common Method)
    func setNavigationTitle(_ title: String) {
        navigationItem.title = title
    }
}
