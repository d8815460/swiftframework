//
//  SwiftHSVColorPicker.swift
//  SwiftHSVColorPicker
//
//  Created by johankasperi on 2015-08-20.
//

import UIKit

public class SwiftHSVColorPicker: UIView {
    var colorWheel: ColorWheel!
    var brightnessView: BrightnessView!
    var saturationView: SaturationView!
    
    var selectedColorView: SelectedColorView!

    public var color: UIColor!
    var hue: CGFloat = 1.0
    var saturation: CGFloat = 1.0
    var brightness: CGFloat = 1.0
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.clearColor()
    }
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public func setViewColor(color: UIColor) {
        var hue: CGFloat = 0.0, saturation: CGFloat = 0.0, brightness: CGFloat = 0.0, alpha: CGFloat = 0.0
        let ok: Bool = color.getHue(&hue, saturation: &saturation, brightness: &brightness, alpha: &alpha)
        if (!ok) {
            print("SwiftHSVColorPicker: exception <The color provided to SwiftHSVColorPicker is not convertible to HSV>")
        }
        self.hue = hue
        self.saturation = saturation
        self.brightness = brightness
        self.color = color
        setup()
    }
    
    func setup() {
        // Remove all subviews
        let views = self.subviews
        for view in views {
            view.removeFromSuperview()
        }
        
        
        let selectedColorViewHeight: CGFloat = 60.0
        let selectedColorBackgroundHeight: CGFloat = 180
        let brightnessViewHeight: CGFloat = 26.0
        let saturationViewHeight: CGFloat = 26.0
        
        // let color wheel get the maximum size that is not overflow from the frame for both width and height
        let colorWheelSize = min(self.bounds.width, self.bounds.height - selectedColorViewHeight - brightnessViewHeight - saturationViewHeight)
        
        // let the all the subviews stay in the middle of universe horizontally
        let centeredX = (self.bounds.width - colorWheelSize) / 2.0
        
        // Init new ColorWheel subview
        colorWheel = ColorWheel(frame: CGRect(x: centeredX, y: 0, width: colorWheelSize, height: colorWheelSize), color: self.color)
        colorWheel.delegate = self
        // Add colorWheel as a subview of this view
        self.addSubview(colorWheel)
    
        let selectedColorBackground = SelectedColorView(frame: CGRect(x: centeredX + colorWheelSize/2 - selectedColorBackgroundHeight/2, y:CGRectGetMaxY(colorWheel.frame)/2 - selectedColorBackgroundHeight/2, width: selectedColorBackgroundHeight, height: selectedColorBackgroundHeight), color: UIColor.whiteColor())
        selectedColorBackground.setCornerRadius(90)
        self.addSubview(selectedColorBackground)
        
        // Init SelectedColorView subview
        selectedColorView = SelectedColorView(frame: CGRect(x: centeredX + colorWheelSize/2 - selectedColorViewHeight/2, y:CGRectGetMaxY(colorWheel.frame)/2 - selectedColorViewHeight/2, width: selectedColorViewHeight, height: selectedColorViewHeight), color: self.color)
        // Add selectedColorView as a subview of this view
        self.addSubview(selectedColorView)
        
        let logo:UIImageView = UIImageView(image: UIImage(named: "icon_colorlight"))
        logo.frame = CGRectMake(centeredX + CGRectGetMaxX(colorWheel.frame)/2 - 9, CGRectGetMaxY(colorWheel.frame)/2 - selectedColorViewHeight/2 + 16, 18, 26)
        self.addSubview(logo)
        
        // Init new BrightnessView subview
        brightnessView = BrightnessView(frame: CGRect(x: centeredX, y: CGRectGetMaxY(colorWheel.frame), width: colorWheelSize, height: brightnessViewHeight), color: self.color)
        brightnessView.delegate = self
        // Add brightnessView as a subview of this view
        self.addSubview(brightnessView)
        
        // Init new SaturationView subview
        saturationView = SaturationView(frame: CGRect(x: centeredX, y: CGRectGetMaxY(colorWheel.frame) + brightnessViewHeight + saturationViewHeight, width: colorWheelSize, height: brightnessViewHeight), color: self.color)
        saturationView.delegate = self
        // Add brightnessView as a subview of this view
        self.addSubview(saturationView)
    }
    
    func hueAndSaturationSelected(hue: CGFloat, saturation: CGFloat) {
        self.hue = hue
//        self.saturation = saturation //使用saturationSelected的參數，在這裡預設saturation
        self.color = UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
        brightnessView.setViewColor(self.color)
        saturationView.setViewColor(self.color)
        selectedColorView.setViewColor(self.color)
    }
    
    func saturationSelected(saturation: CGFloat) {
        self.saturation = saturation
        self.color = UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
//        colorWheel.setViewSaturation(saturation)  //圓盤不隨著變色
        selectedColorView.setViewColor(self.color)
    }
    
    func brightnessSelected(brightness: CGFloat) {
        self.brightness = brightness
        self.color = UIColor(hue: self.hue, saturation: self.saturation, brightness: self.brightness, alpha: 1.0)
//        colorWheel.setViewBrightness(brightness)  //圓盤不隨著變色
        selectedColorView.setViewColor(self.color)
    }
}
