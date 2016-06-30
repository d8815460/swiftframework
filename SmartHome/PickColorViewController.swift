//
//  PickColorViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/5/26.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class PickColorViewController: UIViewController {

    internal var simplemodel: SimpleCellModel!
    // Init ColorPicker with red
    var selectedColor: UIColor = UIColor.redColor()
    
    @IBOutlet weak var colorPicker: SwiftHSVColorPicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        colorPicker.setViewColor(selectedColor)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
