 //
//  SmartDev.m
//  SmartHome Master
//
//  Created by jakey on 2015/1/13.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "DeviceDao.h"
//#import <SmartDevice/SmartDevBase.h>
//#import <SmartDevice/SmartDevFactory.h>
#import "Database.h"
#import "Device.h"
#import "AccessoryDao.h"
#import "Accessory.h"
#import "DeviceUtility.h"
#import "Utility.h"

@implementation DeviceDao

+ (void) initDB
{
//    [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Device(device_id INTEGER PRIMARY KEY AUTOINCREMENT, uid TEXT, class_code SMALLINT, product_name TEXT, name TEXT, password TEXT, location_id INTEGER)"];
    
}

+ (NSArray*)selectWithUid:(NSString*)uid
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
//    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Device WHERE uid = ?", uid];
//    
//    while([rs next]) {
//        int deviceId = [rs intForColumn:@"device_id"];
//        NSString *uid = [rs stringForColumn:@"uid"];
//        unsigned short classCode = (0x0FFFF & [rs intForColumn:@"class_code"]);
//        NSString *productName = [rs stringForColumn:@"product_name"];
//        NSString *name = [rs stringForColumn:@"name"];
//        NSString* password = [rs stringForColumn:@"password"];
//        int locationId = [rs intForColumn:@"location_id"];
//        
//        GLog(tUI, @"Device(%@, %@, %04X, %@, %@, %u)", name, uid, classCode, productName, password, locationId);
//        Device *device = [[Device alloc] init];
//        device.deviceId = deviceId;
//        device.uid = uid;
//        device.classCode = classCode;
//        device.productName = productName;
//        device.name = name;
//        device.password = password;
//        device.locationId = locationId;
//        
//        [array addObject:device];
//    }
//    
//    [rs close];
    
    return array;
}

+ (NSArray*)selectAll
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Device"];
    
    while([rs next]) {
        NSString *uid = [rs stringForColumn:@"uid"];
        unsigned short classCode = (0x0FFFF & [rs intForColumn:@"class_code"]);
        NSString *productName = [rs stringForColumn:@"product_name"];
        NSString *name = [rs stringForColumn:@"name"];
        NSString* password = [rs stringForColumn:@"password"];
        int locationId = [rs intForColumn:@"location_id"];
        
//        GLog(tUI, @"Device(%@, %@, %04X, %@, %@, %u)", name, uid, classCode, productName, password, locationId);
        Device *device = [[Device alloc] init];
        device.uid = uid;
        device.classCode = classCode;
        device.productName = productName;
        device.name = name;
        device.password = password;
        device.locationId = locationId;
        
        [array addObject:device];
    }
    
    [rs close];
    
    return array;
}

+ (BOOL)insertWithDevice:(Device*)device
{
    BOOL result1 = [[Database sharedDatabase].fmdb executeUpdate:@"INSERT INTO Device(uid, class_code, product_name, name, password, location_id) VALUES(?,?,?,?,?,?)",
            device.uid,
            [NSNumber numberWithUnsignedShort:device.classCode],
            device.productName,
            device.name,
            device.password,
            [NSNumber numberWithInt:device.locationId]];
    
    Accessory* accessory = [[Accessory alloc]init];
    accessory.uid = device.uid;
    accessory.aid = 0;
    accessory.type = [DeviceUtility typeByClassCode:device.classCode];
    
    BOOL result2 = [AccessoryDao insertWithSmartDev:accessory];
    
    if (result1 && result2) {
        return YES;
    } else {
        return NO;
    }
}

+ (BOOL)updateSmartDeviceWithUid:(NSString*)uid devicePassword:(NSString*)devicePassword
{
    BOOL b = [[Database sharedDatabase].fmdb executeUpdate:@"UPDATE Device SET password = ? WHERE uid = ?", devicePassword, uid];
    if (b) {
//        GLog(tUI, @"UPDATE成功");
    } else {
//        GLog(tUI, @"UPDATE失敗");
    }
    
    return b;
}

+ (BOOL)updateSmartDeviceWithUid:(NSString*)uid deivceName:(NSString*)deivceName devicePassword:(NSString*)devicePassword
{
    BOOL b = [[Database sharedDatabase].fmdb executeUpdate:@"UPDATE Device SET name = ?, password = ? WHERE uid = ?", deivceName, devicePassword, uid];
    if (b) {
//        GLog(tUI, @"UPDATE成功");
    } else {
//        GLog(tUI, @"UPDATE失敗");
    }
    
    return b;
}

+ (BOOL)deleteSmartDeviceWithUID:(NSString*)uid andAid:(int)aid
{
    @synchronized([Database sharedDatabase].fmdb)
    {
    
        BOOL result1 = [[Database sharedDatabase].fmdb executeUpdate:@"DELETE FROM Device WHERE uid = ?", uid];
        if (result1) {
//            GLog(tUI, @"DELETE成功");
        } else {
//            GLog(tUI, @"DELETE失敗");
        }
        
        // 刪除所有的accessory所對應的uid
        BOOL result2 = [AccessoryDao deleteWithUid:uid aid:aid];
        if (result1 && result2) {
            return YES;
        } else {
            return NO;
        }
    }
    
}

+ (BOOL)deleteSmartDeviceWithUID:(NSString*)uid
{
    @synchronized([Database sharedDatabase].fmdb)
    {
        BOOL result1 = [[Database sharedDatabase].fmdb executeUpdate:@"DELETE FROM Device WHERE uid = ?", uid];
        if (result1) {
//            GLog(tUI, @"DELETE成功");
        } else {
//            GLog(tUI, @"DELETE失敗");
        }
        
//        Accessory *accessory =
        [AccessoryDao getAccessoryWithUID:uid andAid:0];
//        int acc_id = accessory.accessoryId;
        
        // Gateway 底下的所有Sensor
//        NSArray *sensors =
        [AccessoryDao allDevicesInThisUIDWithoutWifiOrGateway:uid];
        
//        [Utility deleteDeviceWithAccessory_ID:acc_id withSensors:sensors WithCurrentUser:[PFUser currentUser] block:^(BOOL succeeded, NSError *error) {
//            if (succeeded) {
//                GLog(tUI, @"group 包含的device已被刪除");
//            }else{
//                GLog(tUI, @"沒有group包含該device需要被刪除");
//            }
//        }];
        
        // 刪除所有的accessory所對應的uid
        BOOL result2 = [AccessoryDao deleteAccessoryWithUid:uid];
        if (result1 && result2) {
            return YES;
        }
        else {
            return NO;
        }
        
        
    }
    
}

@end
