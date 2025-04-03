//
//  CreateCategoryVC.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import UIKit
import IBAnimatable

enum PopupType {
    case Alert
    case Category
}

class CreateCategoryVC: UIViewController {
    
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var textView: AnimatableTextView!
    @IBOutlet weak var txtViewContainer: AnimatableView!
    @IBOutlet weak var lblTitle: UILabel!
    
    var popUpType: PopupType = .Alert
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupView(popUpType: self.popUpType)
    }
    
    func setupView(popUpType: PopupType) {
        self.popUpType = popUpType
        switch popUpType {
        case .Alert:
            lblTitle.text = "Add New Alert"
            txtViewContainer.isHidden = false
            self.txtField.isHidden = true
        case .Category:
            lblTitle.text = "Add New Category"
            txtViewContainer.isHidden = true
            self.txtField.isHidden = false
        }
    }
    
    @IBAction func backgoundButtontap(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    @IBAction func saveOnPress(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}
