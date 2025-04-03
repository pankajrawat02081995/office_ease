//
//  UITableView.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation
import UIKit

extension UITableView{

    func registerNib(nib: String){
        self.register(UINib(nibName: nib, bundle: nil), forCellReuseIdentifier: nib)
    }
}

extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
