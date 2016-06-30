//
//  AccessoryDao.h
//  SmartHome Master
//
//  Created by jakey on 2015/1/16.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Accessory.h"
@interface AccessoryDao : NSObject

+ (void) initDB;

+ (NSArray*)selectAccessoryWithType:(int)type;
+ (NSArray*)selectAccessoryWithType:(int)type uid:(NSString*)uid;

+ (BOOL)insertWithSmartDev:(Accessory*)accessory;

+ (BOOL)deleteAccessoryWithUid:(NSString*)uid;
+ (BOOL)deleteWithUid:(NSString*)uid aid:(int)aid;

+ (NSArray*)getSameAccessoryIdDevices:(int)accessoryId;
+ (NSArray*)allDevicesInThisUIDWithoutWifiOrGateway:(NSString*)uid;
+ (NSArray*)allDevicesInThisUID:(NSString*)uid;
+ (NSArray*)selectAll;
+ (NSArray*)getAccessoryArrayWithUID:(NSString*)uid Aid:(int)aid;

+ (Accessory *)getAccessoryWithId:(int)accessoryId;
+ (Accessory *)getAccessoryWithUID:(NSString *)uid andAid:(int)aid;

@end
