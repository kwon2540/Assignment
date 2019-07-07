//
//  ViewController.swift
//  MoveCell
//
//  Created by JUNHYEOK KWON on 2019/07/07.
//  Copyright © 2019 JUNHYEOK KWON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private weak var collectionView: UICollectionView! {
        didSet {
            collectionView.dataSource = self
        }
    }
    
    private var numbers: [Int] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addGesture()
        createData()
    }
    
    private func addGesture() {
        let longPressGesture = UILongPressGestureRecognizer(target: self, action: #selector(self.moveCell))
        collectionView.addGestureRecognizer(longPressGesture)
    }
    
    private func createData() {
        numbers.removeAll()
        for number in 1...50 {
            numbers.append(number)
        }
    }
    
    @objc func moveCell(gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            guard let selectedCell = collectionView.indexPathForItem(at: gesture.location(in: collectionView)) else { break }
            collectionView.beginInteractiveMovementForItem(at: selectedCell)
        case .changed:
            collectionView.updateInteractiveMovementTargetPosition(gesture.location(in: gesture.view))
        case .ended:
            collectionView.endInteractiveMovement()
        default:
            collectionView.cancelInteractiveMovement()
        }
    }

    @IBAction func reset(_ sender: Any) {
        createData()
        collectionView.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numbers.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.label.text = "\(numbers[indexPath.item])"
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 1
        if numbers[indexPath.item] % 2 == 0 {
            cell.backgroundColor = .lightGray
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, moveItemAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let number = numbers.remove(at: sourceIndexPath.item)
        numbers.insert(number, at: destinationIndexPath.item)
    }
    
    
}

