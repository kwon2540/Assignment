//
//  VerticalSlider.swift
//  VerticalSlider
//
//  Created by JUNHYEOK KWON on 2019/07/17.
//  Copyright © 2019 JUNHYEOK KWON. All rights reserved.
//

import UIKit

class VerticalSlider: UISlider {

    override func awakeFromNib() {
        super.awakeFromNib()
        transform = CGAffineTransform(rotationAngle: -CGFloat.pi / 2)
        autoresizingMask = [.flexibleWidth, .flexibleHeight]
        frame = superview!.bounds
    }

}
