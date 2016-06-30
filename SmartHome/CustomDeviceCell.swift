//
//  CustomDeviceCell.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/5/26.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class CustomDeviceCell: UITableViewCell {
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
