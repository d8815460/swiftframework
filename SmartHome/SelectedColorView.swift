//
//  SelectedColorView.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import UIKit

class SelectedColorView: UIView {
    var color: UIColor!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    init(frame: CGRect, color: UIColor) {
        super.init(frame: frame)
        self.layer.cornerRadius = 30
        setViewColor(color)
    }
    
    func setViewColor(_color: UIColor) {
        color = _color
        setBackgroundColor()
    }
    
    func setBackgroundColor() {
        backgroundColor = color
    }
    
    func setCornerRadius(_raidus: CGFloat) {
        self.layer.cornerRadius = _raidus
    }
}
