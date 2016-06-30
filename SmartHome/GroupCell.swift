//
//  GroupCell.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/5/5.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var logoButton: UIButton!
    @IBOutlet weak var statusLable: UILabel!
    @IBOutlet weak var locationName: UILabel!
    @IBOutlet weak var deviceName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
