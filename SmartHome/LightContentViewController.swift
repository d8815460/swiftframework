//
//  LightContentViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/5/26.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit

class LightContentViewController: UIViewController, UIGestureRecognizerDelegate {

    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var statusLabel: UILabel!
    @IBOutlet weak var locationNameLabel: UILabel!
    @IBOutlet weak var deviceNameLabel: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    var colorpicker: PickColorViewController!
    var setting: LightSettingTableViewController!
    
    var delegate: SwiftHSVColorPicker?
    
    internal var simplemodel: SimpleCellModel!
    
    private var longPressRecognizer: UILongPressGestureRecognizer = {
        let longPressRecognizer = UILongPressGestureRecognizer()
        longPressRecognizer.delaysTouchesBegan = false
        longPressRecognizer.cancelsTouchesInView = false
        longPressRecognizer.numberOfTouchesRequired = 1
        longPressRecognizer.minimumPressDuration = 0.1
        longPressRecognizer.allowableMovement = 10.0
        return longPressRecognizer
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commonInit()
        
        button.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(100, 100)), forState: .Normal)
        button.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(100, 100)), forState: .Highlighted)
        // Do any additional setup after loading the view.
        self.locationNameLabel.text = simplemodel.location
        self.deviceNameLabel.text = simplemodel.name
        image.image = self.getImageFromState(simplemodel.status, type:simplemodel.type)
        
        let storyboard = UIStoryboard(name: "Light", bundle: nil)
        colorpicker = storyboard.instantiateViewControllerWithIdentifier("pickColor") as! PickColorViewController
        scrollView.addSubview(colorpicker.view)
        
        setting = storyboard.instantiateViewControllerWithIdentifier("LightSetting") as! LightSettingTableViewController
        scrollView.addSubview(setting.view)
        
        colorpicker.view.frame = CGRectMake(0, 0, self.view.frame.width, 461)
        setting.view.frame = CGRectMake(0, 400, self.view.frame.width, 208)
        
        scrollView.contentSize = CGSizeMake(self.view.frame.size.width, 629);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - private func
    
    private func commonInit() {
        longPressRecognizer.addTarget(self, action: #selector(LightContentViewController.handleLongPress(_:)))
        longPressRecognizer.enabled = true
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func getImageFromState(status: StatusType, type: AccessoryType) -> UIImage {
        var img = UIImage.init()
        
        if type == AccessoryNone {
            
        } else if type == AccessoryLight {
            if status == StatusOn {
                img = UIImage(named: "ic_light_on")!
                self.statusLabel.text = "On"
            } else if status == StatusOff {
                img = UIImage(named: "ic_light_off")!
                self.statusLabel.text = "Off"
            } else if status == StatusOffline {
                img = UIImage(named: "ic_light_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_light_on")!
            }
        } else if type == AccessoryMotionSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_motion_n")!
                self.statusLabel.text = "Normal"
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_motion_h")!
                self.statusLabel.text = "Trigger"
            } else if status == StatusOffline {
                img = UIImage(named: "ic_motion_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_motion_n")!
            }
        } else if type == AccessoryGarageDoorSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_garage_n")!
                self.statusLabel.text = "Close"
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_garage_h")!
                self.statusLabel.text = "Open"
            } else if status == StatusOffline {
                img = UIImage(named: "ic_garage_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_garage_n")!
            }
        } else if type == AccessoryOpenOrCloseSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_open_n")!
                self.statusLabel.text = "Close"
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_open_h")!
                self.statusLabel.text = "Open"
            } else if status == StatusOffline {
                img = UIImage(named: "ic_open_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_open_n")!
            }
        } else if type == AccessoryWallSwitch {
            if status == StatusOffline {
                img = UIImage(named: "ic_wall_switch_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_wall_switch_n")!
                self.statusLabel.text = "Normal"
            }
        } else if type == AccessoryGroup {
            if status == StatusOn {
                img = UIImage(named: "ic_group_on")!
                self.statusLabel.text = "On"
            } else if status == StatusOff {
                img = UIImage(named: "ic_group_off")!
                self.statusLabel.text = "Off"
            } else if status == StatusOffline {
                img = UIImage(named: "ic_group_d")!
                self.statusLabel.text = "Offline"
            } else {
                img = UIImage(named: "ic_group_on")!
            }
        }
        
        return img
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch began")
    }
    
    override func touchesMoved(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch move")
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        print("touch end")
    }
    
    func handleLongPress(longPressRecognizer: UILongPressGestureRecognizer) {
//        print("handleLongPress")
//        let touchLocation = longPressRecognizer.locationInView(self.view)
    }

    @IBAction func buttonPressed(sender: AnyObject) {
        
        if self.simplemodel?.status == StatusOn {
            self.simplemodel?.status = StatusOff
            self.image.image = self.getImageFromState(simplemodel!.status, type:simplemodel!.type)
        } else if self.simplemodel?.status == StatusOff {
            self.simplemodel?.status = StatusOn
            self.image.image = self.getImageFromState(simplemodel!.status, type:simplemodel!.type)
        }
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
