//
//  SimpleCell.swift
//  Example
//
//  Created by Le VanNghia on 6/29/15.
//  Copyright (c) 2015 Le Van Nghia. All rights reserved.
//

import UIKit
import CommonUX

@objc protocol SimpleCellDelegate {
    func cellButtonPressed(sender: AnyObject)
}

class SimpleCellModel: SACellModel {
    internal let title    : String
    internal var name     : String
    internal var location : String
    internal var status  : StatusType
    internal var type    : AccessoryType
    internal var trigger : TriggerType
    
    init(title: String, name: String, location: String, status: StatusType, type: AccessoryType, trigger:TriggerType, selectionHandler: SASelectionHandler?) {
        self.title = title
        self.name = name
        self.location = location
        self.status = status
        self.type = type
        self.trigger = trigger
        var size = CGSize(width: 110, height: 125)
        
        switch DefauleTheme.getDeviceType {
        case "iphone6":
            size = CGSize(width: 125, height: 130)
        case "iphone6plus": 
            size = CGSize(width: 120, height: 125)
        case "iphone5":
            size = CGSize(width: 100, height: 125)
        case "iphone4": break
            
        default:
            break
        }
        
        super.init(cellType: SimpleCell.self, size: size, selectionHandler: selectionHandler)
    }
}


class SimpleCell: SACell, SACellType, SimpleCellDelegate {
    typealias CellModel = SimpleCellModel
    
    @IBOutlet weak var titleLabel   : UILabel!
    @IBOutlet weak var desLabel     : UILabel!
    @IBOutlet weak var imageView    : UIImageView!
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var triggerImage: UIImageView!
    internal var delegate:SimpleCellDelegate!
    
    var type : AccessoryType!
    
    
    override func configure() {
        super.configure()
        
        guard let cellmodel = cellmodel else {
            return
        }
        titleLabel.text = cellmodel.title
        desLabel.text   = cellmodel.name
        imageView.image = self.getImageFromState(cellmodel.status, type:cellmodel.type)
        type = cellmodel.type
        if self.isTrigger(cellmodel.trigger) {
            triggerImage.hidden = false
        } else {
            triggerImage.hidden = true
        }
        button.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(130, 130)), forState: .Normal)
        button.setBackgroundImage(getImageWithColor(UIColor.clearColor(), size: CGSizeMake(130, 130)), forState: .Highlighted)
        button.sizeToFit()
        switch DefauleTheme.getDeviceType {
        case "iphone6":
            button.frame.size = CGSizeMake(130, 130)
        case "iphone6plus":
            button.frame.size = CGSizeMake(125, 125)
        case "iphone5":
            button.frame.size = CGSizeMake(125, 125)
        case "iphone4": break
            
        default:
            break
        }
    }
    
    // MARK: - private func
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func isTrigger(trigger: TriggerType) -> Bool {
        if trigger == TriggerTypeNone {
            return false
        } else if trigger == TriggerTypeAlarm {
            return true
        } else {
            return false
        }
    }
	
    private func getImageFromState(status: StatusType, type: AccessoryType) -> UIImage {
        var img = UIImage.init()
        
        if type == AccessoryNone {
            
        } else if type == AccessoryLight {
            if status == StatusOn {
                img = UIImage(named: "ic_light_on")!
            } else if status == StatusOff {
                img = UIImage(named: "ic_light_off")!
            } else if status == StatusOffline {
                img = UIImage(named: "ic_light_d")!
            } else {
                img = UIImage(named: "ic_light_on")!
            }
        } else if type == AccessoryMotionSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_motion_n")!
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_motion_h")!
            } else if status == StatusOffline {
                img = UIImage(named: "ic_motion_d")!
            } else {
                img = UIImage(named: "ic_motion_n")!
            }
        } else if type == AccessoryGarageDoorSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_garage_n")!
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_garage_h")!
            } else if status == StatusOffline {
                img = UIImage(named: "ic_garage_d")!
            } else {
                img = UIImage(named: "ic_garage_n")!
            }
        } else if type == AccessoryOpenOrCloseSensor {
            if status == StatusCloseOrNormal {
                img = UIImage(named: "ic_open_n")!
            } else if status == StatusOpenOrTrigger {
                img = UIImage(named: "ic_open_h")!
            } else if status == StatusOffline {
                img = UIImage(named: "ic_open_d")!
            } else {
                img = UIImage(named: "ic_open_n")!
            }
        } else if type == AccessoryWallSwitch {
            if status == StatusOffline {
                img = UIImage(named: "ic_wall_switch_d")!
            } else {
                img = UIImage(named: "ic_wall_switch_n")!
            }
        } else if type == AccessoryGroup {
            if status == StatusOn {
                img = UIImage(named: "ic_group_on")!
            } else if status == StatusOff {
                img = UIImage(named: "ic_group_off")!
            } else if status == StatusOffline {
                img = UIImage(named: "ic_group_d")!
            } else {
                img = UIImage(named: "ic_group_on")!
            }
        }
        
        return img
    }
    
	override func willDisplay(collectionView: UICollectionView) {
		super.willDisplay(collectionView)
	}
    
    
    @IBAction func cellButtonPressed(sender: AnyObject) {
        print("this cell has been pressed \(self.cellmodel)")
        
        if let topController = UIApplication.topViewController() as! KAContainerViewController! {
            if self.cellmodel?.type == AccessoryLight {
                //在這裡按下電燈，是直接控制開關，但是API還沒好，所以這裡只是暫時換icon
                if self.cellmodel?.status == StatusOn {
                    self.cellmodel?.status = StatusOff
                    self.imageView.image = self.getImageFromState(cellmodel!.status, type:cellmodel!.type)
                } else if self.cellmodel?.status == StatusOff {
                    self.cellmodel?.status = StatusOn
                    self.imageView.image = self.getImageFromState(cellmodel!.status, type:cellmodel!.type)
                }
            } else if self.cellmodel?.type == AccessoryMotionSensor {
                
            } else if self.cellmodel?.type == AccessoryGarageDoorSensor {
                
            } else if self.cellmodel?.type == AccessoryOpenOrCloseSensor {
                
            } else if self.cellmodel?.type == AccessoryWallSwitch {
                
            } else if self.cellmodel?.type == AccessoryGroup {
//                print("topController = \(topController.rightViewController?.childViewControllers[0])") //TGDashboardViewController
                topController.rightViewController?.childViewControllers[0].performSegueWithIdentifier("group", sender: self.cellmodel)
            }
        }
    }
}