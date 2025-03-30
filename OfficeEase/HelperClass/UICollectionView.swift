//
//  UICollectionView.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 30/03/25.
//

import Foundation
import UIKit

extension UICollectionView{

    func registerNib(nib: String){
        self.register(UINib(nibName: nib, bundle: nil), forCellWithReuseIdentifier: nib)
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
