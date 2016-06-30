
//
//  SmartDevUtility.m
//  SmartHome Master
//
//  Created by RD1-Gavin on 2014/11/26.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//


#import "DeviceUtility.h"
#import "Accessory.h"
#import "AccessoryDao.h"

extern NSMutableArray* g_arrIotcDevs;

@implementation DeviceUtility

+ (NSArray*)makeSearchDevsByClassCode:(NSArray*)aMatchArrClassCode
{
	NSMutableArray* arrResult = [[NSMutableArray alloc] init];
	
//	if( g_arrIotcDevs ) {
//        if (g_arrIotcDevs != nil) {
//            for( SmartDevBase* devBase in g_arrIotcDevs ) {
//                for( NSNumber* numClassCode in aMatchArrClassCode ) {
////                    GLog(tUI, @"Uid:%@ ClassCode:%04X ...", devBase.mstrUid, (devBase.musClassCode&0x7FFF));
////                    GLog(tUI, @"numClassCode:%04X", [numClassCode unsignedShortValue]&0x7FFF);
//                    if( (devBase.musClassCode&0x7FFF) == ([numClassCode unsignedShortValue]&0x7FFF) ) {
//                        
//                        [arrResult addObject:devBase];
//                        GLog( tUI, @"Uid:%@ ClassCode:%04X ProdName:%@ was add.", devBase.mstrUid, devBase.musClassCode, devBase.mstrProdName );
//                        
//                    }
//                }
//                
//            }
//        }
//	}
	
	return arrResult;
}

//+ (SmartDevBase*)makeSearchDevsByUID:(NSString*)uid
//{
//    if( g_arrIotcDevs ) {
//        for( SmartDevBase* devBase in g_arrIotcDevs ) {
//            if ([devBase.mstrUid isEqualToString:uid]) {
//                return devBase;
//            }
//        }
//    }
//    
//    return nil;
//}

//+ (NSArray*)makeSearchGroupDevsByGrouopID:(int)groupId
//{
//    NSMutableArray* arrResult = [[NSMutableArray alloc] init];
//    
//    if( g_arrIotcDevs ) {
//        
//        NSArray* devicesInThisGroupArray = [[[NSArray alloc] initWithArray:[GroupDao devicesInThisGroup:groupId]] autorelease];
//
//                
//        for( SmartDevBase* devBase in g_arrIotcDevs ) {
//            for (int i = 0; i < devicesInThisGroupArray.count; i++) {
//                NSString* devicesInThisGroupUID= [[devicesInThisGroupArray objectAtIndex:i] uid];
//            
////                GLog( tUI, @"Uid:%@ ClassCode:%04X ...", devBase.mstrUid, (devBase.musClassCode&0x7FFF) );
//                if( [devBase.mstrUid isEqualToString:devicesInThisGroupUID]) {
//                    
//                    [arrResult addObject:devBase];
//                    GLog( tUI, @"Uid:%@ ClassCode:%04X ProdName:%@ was add.", devBase.mstrUid, devBase.musClassCode, devBase.mstrProdName );
//                    
//                }
//            }
//
//        }
//        
//    }
//    
//    return arrResult;
//}

+ (int) typeByClassCode:(unsigned short)classCode
{
    if ([self isGatewayByClassCode:classCode]) {
        return 1;
    } else if ([self isLightByClassCode:classCode]) {
        return 2;
    } else if ([self isSmartPlugByClassCode:classCode]) {
        return 3;
    } else if ([self isCameraByClassCode:classCode]) {
        return 4;
    } else if ([self isDoorByClassCode:classCode]) {
        return 11;
    } else if ([self isSmokeByClassCode:classCode]) {
        return 12;
    } else if ([self isWaterLeakByClassCode:classCode]) {
        return 13;
    } else if ([self isPIRByClassCode:classCode]) {
        return 14;
    } else if ([self isGasByClassCode:classCode]) {
        return 15;
    } else if ([self isVibrateByClassCode:classCode]) {
        return 16;
    } else if ([self isIPCameraByClassCode:classCode]) {
        return 17;
    } else if ([self isLeakByClassCode:classCode]) {
        return 18;
    } else if ([self isAirConditionerByClassCode:classCode]) {
        return 19;
    } else if ([self isSirenByClassCode:classCode]) {
        return 20;
    } else if ([self isDayangPlug1ByClassCode:classCode]) {
        return 21;
    } else if ([self isDayangPlug2ByClassCode:classCode]) {
        return 22;
    } else if ([self isDayangLight1ByClassCode:classCode]) {
        return 23;
    } else if ([self isDayangLight2ByClassCode:classCode]) {
        return 24;
    } else if ([self isDayangPirByClassCode:classCode]) {
        return 25;
    } else if ([self isDayangDoorByClassCode:classCode]) {
        return 26;
    }
    
    return -1;
}

+ (BOOL) isGatewayByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Gateway_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isLightByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Lighting_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isSmartPlugByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_SmartPlug_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isCameraByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Camera_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isDoorByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Door_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isSmokeByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Smoke_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isWaterLeakByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Water_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isPIRByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_PIR_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isGasByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Gas_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isVibrateByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Vibrate_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isIPCameraByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Camera_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isLeakByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Water_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isAirConditionerByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_AirConditioner_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isSirenByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Siren_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}

+ (BOOL) isDayangPlug1ByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_SmartPlug_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
+ (BOOL) isDayangPlug2ByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_SmartPlug_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
+ (BOOL) isDayangLight1ByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Lighting_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
+ (BOOL) isDayangLight2ByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Lighting_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
+ (BOOL) isDayangPirByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_PIR_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
+ (BOOL) isDayangDoorByClassCode:(unsigned short)classCode
{
//    for( NSNumber* code in DEF_DevClassCode_Door_Array) {
//        if ([code unsignedShortValue] == classCode) {
//            return YES;
//        }
//    }
    
    return NO;
}
@end
