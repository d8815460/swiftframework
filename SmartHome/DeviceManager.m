//
//  DeviceManager.m
//  SmartHome Master
//
//  Created by jakey on 2015/1/15.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "DeviceManager.h"
#import "DeviceDao.h"
#import "DeviceUtility.h"
#import "Accessory.h"
#import "AccessoryDao.h"
#import "DeviceDao.h"
#import "Device.h"
#import "TutkTPNSFatcory.h"
#import "Utility.h"

extern NSMutableArray* g_arrIotcDevs;
static DeviceManager* g_deviceManager;

@implementation DeviceManager

//-(SmartDevBase*)addDevice:(Device*)device
//{
//    BOOL result = [DeviceDao insertWithDevice:device];
//    
//    SmartDevBase* devBase = nil;
//    if( result ) {
//        devBase = [SmartDevFactory createSmartDev:device.uid dev_classcode:device.classCode dev_prodname:device.productName dev_name:device.name dev_pwd:device.password smartloc_id:device.locationId];
//        
//        if (devBase != nil) {
//            [g_arrIotcDevs addObject:devBase];
//            [SmartDevFactory connect:devBase];
//            
//            BOOL bResult = [TutkTPNSFatcory mappingWithUid:device.uid];
//            GLog(tUI, @"[TPNS] reg_mapping UID:%@ ...result:(%d)", device.uid, bResult);
//        }
//        else {
//            return nil;
//        }
//    }
//    
//    return devBase;
//}

// WIFI remove with UID
-(BOOL)removeDeviceWithUID:(NSString*)uid
{
    return [self removeDeviceWithUID:uid aid:0];
}

-(BOOL)removeDeviceWithUID:(NSString*)uid aid:(int)aid
{
//    Accessory *accessory =
    [AccessoryDao getAccessoryWithUID:uid andAid:aid];
//    int acc_id = accessory.accessoryId;
    
//    [Utility deleteDeviceWithAccessory_ID:acc_id WithCurrentUser:[PFUser currentUser] block:^(BOOL succeeded, NSError *error) {
//        if (succeeded) {
//            GLog(tUI, @"group 包含的device已被刪除");
//        }else{
//            GLog(tUI, @"沒有group包含該device需要被刪除");
//        }
//    }];
    
    // Gateway or WIFI
    if (aid == 0) {
//        BOOL result = [DeviceDao deleteSmartDeviceWithUID:uid];
//        if (result) {
////            SmartDevBase *deviceBase = [self deviceWithUID:uid];
////            [SmartDevFactory disconnect:deviceBase];
////            [g_arrIotcDevs removeObject:deviceBase];
//            
////            BOOL bResult = [TutkTPNSFatcory unmappingWithUid:deviceBase.mstrUid];
//            //GLog(tUI, @"[TPNS] unreg_mapping UID:%@ ...result:(%d)", deviceBase.mstrUid, bResult);
//            
//            return bResult;
//        }
    }
    // Accessory(Sensor)
    else {
        BOOL result = [AccessoryDao deleteWithUid:uid aid:aid];
        
        NSArray* accressoryList = [AccessoryDao allDevicesInThisUIDWithoutWifiOrGateway:uid];
        // Accessory List 為空(不包含Gateway 或 WIFI本身）
        if (accressoryList.count == 0) {
            
        }
        
        if (result) {
            return result;
        }
    }
    
    return NO;
}

-(BOOL)addAccessoryWithAccessory:(Accessory*)accessory
{
//    BOOL result =
    [AccessoryDao insertWithSmartDev:accessory];
    
//    if ([self.device isKindOfClass:[ZhongHanDevBase class]]) {
//        ZhongHanDevBase *zhongHanDevBase = (ZhongHanDevBase*)self.device;
//        zhongHanDevBase.delegate = self;
//        
//        [zhongHanDevBase registerSensor];
//        
//        MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self.navigationController.view animated:YES];
//        [HUD setLabelText:NSLocalizedString(@"Pairing...", @"")];
//        [HUD hide:YES afterDelay:30.0f];
//    }
    
    return NO;
}

-(BOOL)isDeviceWithUid:(NSString*)uid
{
//    return [self deviceWithUID:uid] != nil ? YES : NO;
    return true;
}

-(NSArray*)listDevices
{
    return [DeviceDao selectAll];
}

- (void)loadDevices
{
//    NSArray *array = [self listDevices];
    
//    for(Device *device in array) {
//        SmartDevBase* dev = [SmartDevFactory createSmartDev:device.uid dev_classcode:device.classCode dev_prodname:device.productName dev_name:device.name dev_pwd:device.password smartloc_id:device.locationId];
//        
//        if( dev != nil ) {
//            [g_arrIotcDevs addObject:dev];
//            [SmartDevFactory connect:dev];
//        }
//    }
}

#pragma mark - Private Method

//-(SmartDevBase*)deviceWithUID:(NSString*)uid
//{
//    if (g_arrIotcDevs != nil) {
//        for( SmartDevBase* devBase in g_arrIotcDevs ) {
//            if ([devBase.mstrUid isEqualToString:uid]) {
//                return devBase;
//            }
//        }
//    }
//    return nil;
//}

#pragma mark - Singleton Implementation

+ (DeviceManager*)sharedDeviceManager
{
    if (g_deviceManager == nil) {
        g_deviceManager = [[DeviceManager alloc] init];
    }
    
    return g_deviceManager;
}


@end
