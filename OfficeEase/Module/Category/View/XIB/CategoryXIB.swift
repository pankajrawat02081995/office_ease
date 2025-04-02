//
//  CategoryXIB.swift
//  OfficeEase
//
//  Created by Pankaj Rawat on 02/04/25.
//

import UIKit
import IBAnimatable

class CategoryXIB: UICollectionViewCell {
    
    @IBOutlet weak var lblCat: AnimatableLabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        setupUI()
    }
    
    func setupCornerRadius(height: CGFloat) {
        lblCat.layer.cornerRadius = height / 2
        lblCat.layer.masksToBounds = true
    }
    
}
