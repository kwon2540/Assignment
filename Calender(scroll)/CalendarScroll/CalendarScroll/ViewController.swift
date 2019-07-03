//
//  ViewController.swift
//  CalendarScroll
//
//  Created by JUNHYEOK KWON on 2019/06/30.
//  Copyright © 2019 JUNHYEOK KWON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    private var zeroCell: CollectionViewCell?
    private var cellWidth: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.decelerationRate = .init(rawValue: .zero)
    }

    private func scrollingCorrection() {
        let x =  Int(collectionView.contentOffset.x)
        let correctionX = Int(x / cellWidth) * cellWidth
        if x % cellWidth > cellWidth / 2 {
            collectionView.setContentOffset(CGPoint(x: correctionX + cellWidth, y: 0), animated: true)
        } else {
            collectionView.setContentOffset(CGPoint(x: correctionX, y: 0), animated: true)
        }
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 100
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        cell.layer.borderWidth = 0.5
        cell.layer.borderColor = UIColor.black.cgColor
        cell.label.text = "\(indexPath.section)"
        cellWidth = Int(cell.frame.width)
        return cell
    }
    
    func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        scrollingCorrection()
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        scrollingCorrection()
    }

}
