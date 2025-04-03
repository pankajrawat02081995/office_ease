//
//  SignInVC.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import UIKit

class SignInVC: UIViewController {

    @IBOutlet weak var phoneNumberTextFieldContainer: UIView!
    @IBOutlet weak var emailTextFieldContainer: UIView!
    @IBOutlet weak var userNameTextFieldContainer: UIView!
    
    @IBOutlet weak var emailButtonContainer: UIView!
    @IBOutlet weak var userNameButtonContainer: UIView!
    @IBOutlet weak var phoneButtonContainer: UIView!
    
    @IBOutlet weak var txtEmail: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyGradient()
        setupLoginWithEmail()
    }
    
    @IBAction func emailButtonOnClick(_ sender: UIButton) {
        setupLoginWithEmail()
    }
    
    @IBAction func phoneButtonOnClick(_ sender: UIButton) {
        setupPhoneNumberLogin()
    }
    
    @IBAction func userNameButtonOnClick(_ sender: UIButton) {
        setupUserNameLogin()
    }
    
    private func setupLoginWithEmail() {
        toggleContainers(active: emailTextFieldContainer,
                         inactive: [userNameTextFieldContainer, phoneNumberTextFieldContainer])
        toggleButtons(active: emailButtonContainer,
                      inactive: [userNameButtonContainer, phoneButtonContainer])
    }
    
    private func setupPhoneNumberLogin() {
        toggleContainers(active: phoneNumberTextFieldContainer,
                         inactive: [emailTextFieldContainer, userNameTextFieldContainer])
        toggleButtons(active: phoneButtonContainer,
                      inactive: [emailButtonContainer, userNameButtonContainer])
    }
    
    private func setupUserNameLogin() {
        toggleContainers(active: userNameTextFieldContainer,
                         inactive: [emailTextFieldContainer, phoneNumberTextFieldContainer])
        toggleButtons(active: userNameButtonContainer,
                      inactive: [emailButtonContainer, phoneButtonContainer])
    }
    
    private func toggleContainers(active: UIView, inactive: [UIView]) {
        active.isHidden = false
        inactive.forEach { $0.isHidden = true }
    }
    
    private func toggleButtons(active: UIView, inactive: [UIView]) {
        active.isHidden = true
        inactive.forEach { $0.isHidden = false }
    }
    
    @IBAction func nextOnPress(_ sender: UIButton) {
//        guard let text = self.txtEmail.text, !text.isEmpty else {
//            txtEmail.shake()
//            return
//        }
        self.pushViewController(ofType: CategoryVC.self, fromStoryboard: .main)
    }
}
