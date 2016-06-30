//
//  ColorPickerCell.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/5/26.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class ColorPickerCell: UITableViewCell {
    
    // Init ColorPicker with red
    var selectedColor: UIColor = UIColor.redColor()
    
    // IBOutlet for the ColorPicker
    @IBOutlet weak var colorPicker: SwiftHSVColorPicker!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        // Setup Color Picker
        colorPicker.setViewColor(selectedColor)
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func getSelectedColor() -> UIColor {
        // Get the selected color from the Color Picker.
        let selectedColor = colorPicker.color
        return selectedColor
    }

}
