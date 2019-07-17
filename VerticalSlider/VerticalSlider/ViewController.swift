//
//  ViewController.swift
//  VerticalSlider
//
//  Created by JUNHYEOK KWON on 2019/07/17.
//  Copyright © 2019 JUNHYEOK KWON. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!
    @IBOutlet private weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = "\(Int(slider.value))"
        slider.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
    }
    
    @objc private func valueChanged() {
        label.text = "\(Int(slider.value))"
    }

}
