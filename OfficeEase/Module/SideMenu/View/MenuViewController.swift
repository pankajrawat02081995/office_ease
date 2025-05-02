//
//  MenuViewController.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 02/05/25.
//

import UIKit

//MARK: How to use
//Call this function direct -> SideMenuManager.shared.toggleMenu()

// MARK: - Menu View Controller

struct SideMenuItem {
    let title: String
    let image: UIImage
    let subtitle: [String]
}

protocol MenuViewControllerDelegate: AnyObject {
    func didSelect(menuItem: SideMenuItemType)
}

enum SideMenuItemType {
    case general, professional, trucking, other
}

@MainActor
final class MenuViewController: UIViewController {
    weak var delegate: MenuViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
