//
//  TGDashboardViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/19.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX
import Popover
import Parse

class TGDashboardViewController: UIViewController, DrapDropCollectionViewDelegate, UICollectionViewDataSource {
    
    private var allSelectedObserver:                    NSObjectProtocol?
    private var filterByDeviceSelectedObserver:         NSObjectProtocol?
    private var lightingAndControlsSelectedObserver:    NSObjectProtocol?
    private var doorsAndWindowsSelectedObserver:        NSObjectProtocol?
    private var damagePreventionSelectedObserver:       NSObjectProtocol?
    
    @IBOutlet var collectionView: DragDropCollectionView!
    var fromIndexPath:NSIndexPath!  = NSIndexPath(forRow: 0, inSection: 0)
    var toIndexPath:NSIndexPath!    = NSIndexPath(forRow: 0, inSection: 0)
    var fromingIndexPath:NSIndexPath! = NSIndexPath(forRow: 0, inSection: 0)
    var filterButton: UIButton!
    var PopMenu: PopMenuViewController = PopMenuViewController()
    var popMenuPressed: Bool!
    var cellDelegate: SimpleCellDelegate!
    
    private var section = SASection()
    private var gateway: DMGateway!
    private var popover: Popover!
    private var popoverOptions: [PopoverOption] = [
        .Color(DefauleTheme.SubColor),
        .BlackOverlayColor(UIColor(white: 0.0, alpha: 0.6))
    ]
    
    lazy var sapporo: Sapporo = { [unowned self] in
        return Sapporo(collectionView: self.collectionView)
        }()
    
    // MARK: - Life Cycle
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        addObservers()
        popMenuPressed = false
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        removeObservers()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.whiteColor()
        
        filterButton = UIButton(type: .Custom)
        filterButton.setImage(UIImage(named: "btn_filter_n"), forState: .Normal)
        filterButton.addTarget(self, action: #selector(TGDashboardViewController.filterButtonPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        filterButton.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Normal)
        filterButton.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Highlighted)
        filterButton.frame = CGRectMake(0, 0, 43, 31)
        
        let addButton = UIBarButtonItem(title: "+", style: .Plain, target: self, action: #selector(TGDashboardViewController.addButtonPressed(_:)))
        addButton.image = UIImage(named: "btn_add_n")
        let filter: UIBarButtonItem! = UIBarButtonItem(customView: filterButton)
        self.navigationItem.setRightBarButtonItems([addButton, filter], animated: true)
        
        collectionView.draggingDelegate = self
        collectionView.enableDragging(true)
        collectionView.contentInset = UIEdgeInsets(top: 10, left: 0, bottom: 0, right: 0)
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        sapporo
            .registerCellByNib(SimpleCell)
            .registerSupplementaryViewByNib(SimpleHeaderView.self, kind: UICollectionElementKindSectionHeader)
        
        sapporo.setLayout(SAFlowLayout())
        sapporo.loadmoreEnabled = true
        sapporo.loadmoreHandler = {
            print("Loadmore")
        }
        
        DMGateway.dataWithUID("xxx", completionBlock: { (gw) in
            self.gateway = gw
            print("==========================================================")
            print("gw = \(self.gateway)")
            print("number of locations = \(self.gateway.numberOfLocations())")
            let location: DMLocation = self.gateway.locationAtSection(0)
            print("Name of location = \(location.name)")
            print("number of location = \(location.arrAccessories.count)")
            let accessory: DMBaseAccessory = location.accessoryAtIndex(0)
            print("Name of accessorie = \(accessory.name)")
            print("Status of accessorie = \(accessory.status)")
            print("Type of accessorie = \(accessory.type)")
            print("trigger of accessorie = \(accessory.trigger)")
            print("Id of accessorie = \(accessory.identity)")
            print("==========================================================")
            self.reload()
        }) { (error) in
            print("error = \(error)")
        }
    }
    
    
    // MARK: - private func
    
    private func reload() {
        
        if gateway != nil {
            let loctaionNums = self.gateway.numberOfLocations()
            section.inset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            section.minimumLineSpacing = 10
            
            for i in 0..<loctaionNums {
                section = SASection()
                
                let locationNum = UInt(i)
                let countIndex:NSInteger = self.gateway.locationAtSection(locationNum).arrAccessories.count
                
                let cellmodels = (0...countIndex-1).map { index -> SimpleCellModel in
                    let countIndex = UInt(index)
                    let accessory = self.gateway.locationAtSection(locationNum).accessoryAtIndex(countIndex)
                    return SimpleCellModel(title: "cell \(index)", name: "\(accessory.name)", location: "\(self.gateway.locationAtSection(locationNum).name)", status:accessory.status , type: accessory.type, trigger: accessory.trigger) { cell in
                        let indexPath = cell._cellmodel?.indexPath
                        let sampleCell = cell as! SimpleCell
                        print("Selected: indexPath: \(indexPath?.section), \(indexPath?.row), cell._cellmodel:\(sampleCell.type)")
                        self.cellPressed(sampleCell, index: indexPath!)
                    }
                }
                
                // Header 標頭
                if locationNum == 0 {
                    section.headerViewModel = SimpleHeaderViewModel(title: "<\(self.gateway.locationAtSection(locationNum).name)>", height: 25)
                    sapporo
                        .reset(section)
                        .bump()
                    section
                        .reset(cellmodels)
                        .bump()
                }else{
                    section.headerViewModel = SimpleHeaderViewModel(title: "<\(self.gateway.locationAtSection(locationNum).name)>", height: 25)
                    section.append(cellmodels)
                    sapporo
                        .insert(section, atIndex: Int(locationNum))
                        .bump()
                }
            }
        }
    }
    
    // MARK: Private Function
    
    private func getImageWithColor(color: UIColor, size: CGSize) -> UIImage {
        let rect = CGRectMake(0, 0, size.width, size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    private func cellPressed(sampleCell: SimpleCell, index: NSIndexPath) {
        if sampleCell.type == AccessoryNone {
            
        } else if sampleCell.type == AccessoryLight {
            self.performSegueWithIdentifier("Light", sender: sampleCell.cellmodel)
        } else if sampleCell.type == AccessoryMotionSensor {
            
        } else if sampleCell.type == AccessoryGarageDoorSensor {
            
        } else if sampleCell.type == AccessoryOpenOrCloseSensor {
            
        } else if sampleCell.type == AccessoryWallSwitch {
            
        } else if sampleCell.type == AccessoryGroup {
            self.performSegueWithIdentifier("group", sender: sampleCell)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: NotificationCenter Observers
    
    private func addObservers() {
        let center = NSNotificationCenter.defaultCenter()
        
        
        allSelectedObserver = center.addObserverForName(kTGPopMenuDidSelectedAll, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            
        })
        
        filterByDeviceSelectedObserver = center.addObserverForName(kTGPopMenuDidSelectedFilterByDeviceType, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            print("filterByDeviceSelectedObserver")
            if (self.popMenuPressed != nil) && (self.popMenuPressed == true) {
                self.popMenuPressed = false
            } else {
                self.popMenuPressed = true
            }
            if self.popMenuPressed == false {
//                self.PopMenu.view.frame = CGRectMake(0, 10, 220, 88)
//                self.PopMenu.tableView.frame = CGRectMake(0, 10, 220, 88)
            } else {
                self.PopMenu.view.frame = CGRectMake(0, 10, kTGPopMenuWidth, 220)
                self.PopMenu.tableView.frame = CGRectMake(0, 0, kTGPopMenuWidth, 220)
            }
            
        })
        
        lightingAndControlsSelectedObserver = center.addObserverForName(kTGPopMenuDidSelectedLightingAndControls, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            print("lightingAndControlsSelectedObserver")
        })
        
        doorsAndWindowsSelectedObserver = center.addObserverForName(kTGPopMenuDidSelectedDoorsAndWindows, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            print("doorsAndWindowsSelectedObserver")
        })
        
        damagePreventionSelectedObserver = center.addObserverForName(kTGPopMenuDidSelectedDamagePrevention, object: nil, queue: nil, usingBlock: { (notification: NSNotification!) in
            print("DamagePreventionSelectedObserver")
        })
    }
    
    private func removeObservers() {
        let center = NSNotificationCenter.defaultCenter()
        
        if allSelectedObserver != nil {
            center.removeObserver(allSelectedObserver!)
        }
        if filterByDeviceSelectedObserver != nil {
            center.removeObserver(filterByDeviceSelectedObserver!)
        }
        if lightingAndControlsSelectedObserver != nil {
            center.removeObserver(lightingAndControlsSelectedObserver!)
        }
        if doorsAndWindowsSelectedObserver != nil {
            center.removeObserver(doorsAndWindowsSelectedObserver!)
        }
        if damagePreventionSelectedObserver != nil {
            center.removeObserver(damagePreventionSelectedObserver!)
        }
    }
    
    // MARK: - IBAction
    
    @IBAction func toggleWiggle(sender: UISwitch) {
        if sender.on {
            collectionView.startWiggle()
        } else {
            collectionView.stopWiggle()
        }
    }
    
    @IBAction internal func filterButtonPressed(sender: UIBarButtonItem) {
        let startPoint = CGPoint(x: self.view.frame.width - 80, y: 55)
        self.popMenuPressed = false
        PopMenu.view.frame = CGRectMake(0, 0, kTGPopMenuWidth, kTGPopMenuHeight)
        PopMenu.tableView.frame = CGRectMake(0, 0, kTGPopMenuWidth, kTGPopMenuHeight)
        let index:FlexibleIndexPath! = FlexibleIndexPath(forSubRow: 0, inRow: 1, inSection: 0)
        PopMenu.tableView.setExpanded(false, forCellAtIndexPath: index)
        PopMenu.tableView.reloadData()
        let popover = Popover(options: popoverOptions, showHandler: nil, dismissHandler: nil)
        
        popover.show(PopMenu.view, point: startPoint)
    }
    
    @IBAction internal func addButtonPressed(sender: UIBarButtonItem) {
        
    }
    
    // MARK: - collectionViewDelegate
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("collectionViewCell", forIndexPath: indexPath) as UICollectionViewCell
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath){
        let cell: SimpleCell! = collectionView.cellForItemAtIndexPath(indexPath)! as! SimpleCell
        print("did selected: \(indexPath.section) \(cell.desLabel.text) \(cell.titleLabel.text)")
        
    }
    
    func dragDropCollectionViewDraggingDidBeginWithCellAtIndexPath(indexPath: NSIndexPath) {
        // 開始移動中
        let cell: SimpleCell! = collectionView.cellForItemAtIndexPath(indexPath)! as! SimpleCell
        print("開始移動中 section:\(indexPath.section), row:\(indexPath.row), \(cell.desLabel.text)")
        fromIndexPath = indexPath
    }
    
    func dragDropCollectionViewDidMoveCellFromInitialIndexPath(initialIndexPath: NSIndexPath, toNewIndexPath newIndexPath: NSIndexPath) {
        // 正在移動中
        print("正在移動中 from section:\(initialIndexPath.section), from row:\(initialIndexPath.row) to section:\(newIndexPath.section), from row:\(newIndexPath.row)")
        
        toIndexPath = newIndexPath
        fromingIndexPath = initialIndexPath
        
        if fromingIndexPath.section != toIndexPath.section {
            self.sapporo.sections[toIndexPath.section]
                .insert(self.sapporo.sections[fromingIndexPath.section].cellmodels[fromingIndexPath.row], atIndex: toIndexPath.row)
                .bump()
            
            self.sapporo.sections[fromingIndexPath.section]
                .remove(fromingIndexPath.row)
                .bump()
        }
    }
    
    /* 範例
     //        section
     //            .append([cellmodels[1], cellmodels[3], cellmodels[4]])
     //            .bump()
     //        MARK - 插入新Cell
     //        section
     //            .insert(cellmodels[2], atIndex: 2)
     //            .bump()
     //        MARK - 變更內容
     cellmodels[0].des = "changed"
     cellmodels[0].bump()
     //        MARK - 刪除
     //        section
     //            .remove(1)
     //            .bump()
     //        MARK - 移動
     //        section
     //            .move(fromIndex: 2, toIndex: 0)
     //            .bump()
     */
    
    func dragDropCollectionViewDraggingDidEndForCellAtIndexPath(indexPath: NSIndexPath, toNewIndexPath newIndexPath: NSIndexPath) {
        // 結束移動後
        print("結束移動後 from:\(fromingIndexPath.section), row:\(fromingIndexPath.row)")
        print("結束移動後 to:\(indexPath.section), row:\(indexPath.row)")
        print("結束移動後 to:\(newIndexPath.section), row:\(newIndexPath.row)")
        
        if (fromingIndexPath.section == newIndexPath.section) && (fromingIndexPath.row == newIndexPath.row) {
            
        } else {
            PFAlertView.showAlertWithTitle(nil, message: NSLocalizedString("Create a master control group?", comment: "dashboard"), cancelButtonTitle: NSLocalizedString("Cancel", comment: "dashboard"), otherButtonTitles: [NSLocalizedString("OK", comment: "dashboard")], completion: { (selectedOtherButtonIndex) in
                // otherButton, first = 0, second = 1
                
                if selectedOtherButtonIndex != 0 {
                    //取消
                    
                } else {
                    //OK，進行合併成為Group作業
                    
                    let section = self.sapporo.sections[indexPath.section]
                    section
                        .remove(indexPath.row)
                        .bump()
                    
                    let cellmodel:SimpleCellModel = self.sapporo.sections[newIndexPath.section].cellmodels[newIndexPath.row] as! SimpleCellModel
                    cellmodel.name = "group"
                    cellmodel.type = AccessoryGroup
                    cellmodel.bump()
                }
            })
        }

        toIndexPath = indexPath
        
        if fromingIndexPath.section != toIndexPath.section {
            // 跨空間的移動
            toIndexPath = nil
        } else {
            toIndexPath = nil
        }
    }
    
    
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
        
        if segue.identifier == "Light" {
//            let vc:LightDetailTableViewController = segue.destinationViewController as! LightDetailTableViewController
            let vc:LightContentViewController = segue.destinationViewController as! LightContentViewController
            vc.simplemodel = sender as! SimpleCellModel
        }
     }
 
}


extension TGDashboardViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.popover.dismiss()
    }
}

extension TGDashboardViewController: UITableViewDataSource {
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 3
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Default, reuseIdentifier: nil)
        cell.textLabel?.text = "index = \(indexPath.row)"
        return cell
    }
}