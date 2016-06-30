//
//  KAContainerViewController.swift
//  SmartHome
//
//  Created by 駿逸 陳 on 2016/4/18.
//  Copyright © 2016年 TUTK. All rights reserved.
//

import UIKit
import CommonUX
import Parse

class KAContainerViewController: UIViewController {

    var menuShown: Bool = false
    
    private var openMenu: NSObjectProtocol?
    private var closeMenu: NSObjectProtocol?
    
    var mainNavigation: KANavigationController!
    
    var leftViewController: UIViewController? {
        willSet{
            if self.leftViewController != nil {
                if self.leftViewController!.view != nil {
                    self.leftViewController!.view!.removeFromSuperview()
                }
                self.leftViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            self.view!.addSubview(self.leftViewController!.view)
            self.addChildViewController(self.leftViewController!)
        }
    }
    
    var rightViewController: UIViewController? {
        willSet {
            if self.rightViewController != nil {
                if self.rightViewController!.view != nil {
                    self.rightViewController!.view!.removeFromSuperview()
                }
                self.rightViewController!.removeFromParentViewController()
            }
        }
        
        didSet{
            self.view!.addSubview(self.rightViewController!.view)
            self.addChildViewController(self.rightViewController!)
        }
    }
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let frameworkBundle = NSBundle(identifier: kTGCommonUXBundleIdentifierKey)
        let storyboard = UIStoryboard(name: "AddDevice", bundle: frameworkBundle)
        let emptyData = storyboard.instantiateViewControllerWithIdentifier("empty")
        
        let menuViewController: FlexibleMenuViewController = FlexibleMenuViewController()
        // 預設載入的第一個畫面
        mainNavigation = KANavigationController(rootViewController:emptyData)
        self.leftViewController = menuViewController
        self.rightViewController = mainNavigation
        addObservers()
    }
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        let button: UIButton = UIButton(type: UIButtonType.Custom)
        //set image for button
        button.setImage(UIImage(named: "btn_sidemenu_n.png"), forState: UIControlState.Normal)
        //add function for button
        button.addTarget(self, action: #selector(KAContainerViewController.touchMenu(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        //set frame
        button.frame = CGRectMake(0, 0, 53, 31)
        button.backgroundColor = UIColor.clearColor()
        button.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Normal)
        button.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Highlighted)
        
        let barButton:UIBarButtonItem = UIBarButtonItem(customView: button)
        
        mainNavigation.viewControllers.first?.navigationItem.setLeftBarButtonItem(barButton, animated: true)
        
        
        /* 使用者還沒登入，使用 framework 裡面的 Login storybaord */
        if PFUser.currentUser() == nil {
            let frameworkBundle = NSBundle(identifier: kTGCommonUXBundleIdentifierKey)
            let storyboard = UIStoryboard(name: "Login", bundle: frameworkBundle)
            self.presentViewController(storyboard.instantiateInitialViewController()!, animated: true) {
                
            }
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
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private func
    
    private func addObservers() {
        let center = NSNotificationCenter.defaultCenter()
        openMenu = center.addObserverForName("openMenu", object: nil, queue: nil) { (notification: NSNotification!) in
            self.showMenu()
        }
        closeMenu = center.addObserverForName("closeMenu", object: nil, queue: nil) { (notification: NSNotification!) in
            
            let button: UIButton = UIButton(type: UIButtonType.Custom)
            //set image for button
            button.setImage(UIImage(named: "btn_sidemenu_n.png"), forState: UIControlState.Normal)
            //add function for button
            button.addTarget(self, action: #selector(KAContainerViewController.touchMenu(_:)), forControlEvents: UIControlEvents.TouchUpInside)
            //set frame
            button.frame = CGRectMake(0, 0, 53, 31)
            button.backgroundColor = UIColor.clearColor()
            button.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Normal)
            button.setBackgroundImage(self.getImageWithColor(UIColor.clearColor(), size: CGSizeMake(50, 50)), forState: .Highlighted)
            
            
            let barButton:UIBarButtonItem = UIBarButtonItem(customView: button)
            
            self.mainNavigation.viewControllers.first?.navigationItem.leftBarButtonItems = [barButton]
            self.hideMenu()
        }
    }
    
    private func removeObservers(){
        let center = NSNotificationCenter.defaultCenter()
        if closeMenu !=  nil {
            center.removeObserver(closeMenu!)
        }
        if openMenu !=  nil {
            center.removeObserver(openMenu!)
        }
    }
    
    // MARK: - Public func
    
    func touchMenu(object: AnyObject) {
        if menuShown {
            hideMenu()
        } else {
            showMenu()
        }
    }

    func showMenu() {
        UIView.animateWithDuration(0.2, animations: {
            self.rightViewController!.view.frame = CGRect(x: self.view.frame.size.width - 64, y: self.view.frame.origin.y,
                width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShown = true
                self.reloadShadow(self.rightViewController!.view)
        })
    }
    
    func hideMenu() {
        UIView.animateWithDuration(0.2, animations: {
            self.rightViewController!.view.frame = CGRect(x: 0, y: self.view.frame.origin.y,
                width: self.view.frame.width, height: self.view.frame.height)
            }, completion: { (Bool) -> Void in
                self.menuShown = false
        })
    }
    
    func reloadShadow(view:UIView)
    {
        let frontViewLayer = view.layer
        frontViewLayer.shadowColor = UIColor.blackColor().CGColor
        frontViewLayer.shadowOpacity = 0.7
        frontViewLayer.shadowOffset = CGSize(width: 1,height: 1)
        frontViewLayer.shadowRadius = 3.0
    }
    
    
    // MARK: - Action
    
    @IBAction func swipeRight(sender: UISwipeGestureRecognizer) {
        showMenu()
    }
    
    @IBAction func swipeLeft(sender: UISwipeGestureRecognizer) {
        hideMenu()
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
