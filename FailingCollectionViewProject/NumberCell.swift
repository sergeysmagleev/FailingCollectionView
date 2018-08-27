//
//  NumberCell.swift
//  FailingCollectionViewProject
//
//  Created by Sergey Smagleev on 16.07.18.
//  Copyright © 2018 Sergey Smagleev. All rights reserved.
//

import UIKit

class NumberCell: UICollectionViewCell {
    
    @IBOutlet weak var numberLabel: UILabel!
    
    func makeSelected() {
        backgroundColor = .black
    }
    
    func makeUnselected() {
        backgroundColor = .lightGray
    }
    
}
