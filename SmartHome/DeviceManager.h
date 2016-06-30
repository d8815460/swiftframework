//
//  DeviceManager.h
//  SmartHome Master
//
//  Created by jakey on 2015/1/15.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"

@interface DeviceManager : NSObject

+ (DeviceManager*)sharedDeviceManager;

-(NSArray*)listDevices;
//-(SmartDevBase*)addDevice:(Device*)device;

-(BOOL)removeDeviceWithUID:(NSString*)uid;
-(BOOL)removeDeviceWithUID:(NSString*)uid aid:(int)aid;

-(BOOL)isDeviceWithUid:(NSString*)uid;
-(void)loadDevices;

@end
