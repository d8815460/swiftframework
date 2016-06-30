//
//  DMAccessory.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

@import UIKit;

#import "DMAccessory.h"

@interface DMAccessory ()

@property (nonatomic, strong) UIColor *color;

@property (nonatomic, assign) CGFloat hue;
@property (nonatomic, assign) CGFloat saturation;
@property (nonatomic, assign) CGFloat brightness;
@property (nonatomic, assign) CGFloat alpha;

@end


@implementation DMAccessory

-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    self = [super initWithDictionary: dict];
    
    [self updateWithDictionary: dict];
    
    return self;
}

-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
}


#pragma mark - /// getter

-(NSString *)keyJsonArray
{
    return nil;
}


#pragma mark - /// setter


#pragma mark - /// helper

-(BOOL)colorToHUE
{
    BOOL success = [self.color getHue: &_hue
                           saturation: &_saturation
                           brightness: &_brightness
                                alpha: &_alpha];
    
    return success;
}

@end
