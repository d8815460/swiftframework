//
//  SmartDev.h
//  SmartHome Master
//
//  Created by jakey on 2015/1/13.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Device.h"

@interface DeviceDao : NSObject

+ (void) initDB;

+ (NSArray*)selectWithUid:(NSString*)uid;
+ (NSArray*)selectAll;

+ (BOOL)insertWithDevice:(Device*)device;       //增
+ (BOOL)deleteSmartDeviceWithUID:(NSString*)uid andAid:(int)aid;    //刪
+ (BOOL)deleteSmartDeviceWithUID:(NSString*)uid;    //刪

+ (BOOL)updateSmartDeviceWithUid:(NSString*)uid devicePassword:(NSString*)devicePassword; //改
+ (BOOL)updateSmartDeviceWithUid:(NSString*)uid deivceName:(NSString*)deivceName devicePassword:(NSString*)devicePassword;  //改


@end
