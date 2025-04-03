//
//  CustomAlertVC.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 03/04/25.
//

import UIKit

class CustomAlertVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
   
    
    @IBAction func nextOnPress(_ sender: UIButton) {
        
    }
    
    @IBAction func createOnPress(_ sender: UIButton) {
        let vc = CreateCategoryVC.instantiate()
        vc.modalTransitionStyle = .crossDissolve
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
    }
    
}
