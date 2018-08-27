//
//  ViewController.swift
//  FailingCollectionViewProject
//
//  Created by Sergey Smagleev on 16.07.18.
//  Copyright © 2018 Sergey Smagleev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    private var selectedIndex: IndexPath? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }

}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        if let oldIndex = selectedIndex,
            let oldCell = collectionView.cellForItem(at: oldIndex) as? NumberCell {
            oldCell.makeUnselected()
        }
        selectedIndex = indexPath == selectedIndex ? nil : indexPath
        if let newIndex = selectedIndex,
            let newCell = collectionView.cellForItem(at: newIndex) as? NumberCell {
            newCell.makeSelected()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 128.0, height: 128.0)
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 16.0
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 16.0, bottom: 16.0, right: 0)
    }
    
}

extension ViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        if let numberCell = cell as? NumberCell {
            numberCell.numberLabel.text = "\(indexPath.row)"
            indexPath == selectedIndex ? numberCell.makeSelected() : numberCell.makeUnselected()
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }

}

