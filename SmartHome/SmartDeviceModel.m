//
//  SmartDeviceModel.m
//  DragAndDrop
//
//  Created by 駿逸 陳 on 2015/11/18.
//  Copyright © 2015年 駿逸 陳. All rights reserved.
//

#import "SmartDeviceModel.h"
#import "DeviceFunctionCode.h"

@implementation SmartDeviceModel

- (instancetype)initWithUid:(NSString *)uid AndAid:(int)aid AndType:(int)type AndNmae:(NSString *)name atLocationIndex:(int)locationIndex withIndex:(int)index
{
    if (self = [super init]) {
        self.uid           = uid;
        self.aid           = aid;
        self.type          = type;
        self.locationIndex = locationIndex;
        self.index         = index;
        self.name          = name;
    }
    return self;
}

//+(NSArray *)parseFromAccessories: (LPSAIRCONDITIONERACCESSORYITEM)accessories
//{
//    NSMutableArray *arrDevices = [[NSMutableArray alloc] init];
//    
//    GLog(tUI, @"totalCount:%d", accessories->totalCount);
//    GLog(tUI, @"countIndex:%d", accessories->countIndex);
//    GLog(tUI, @"amount:%d",     accessories->amount);
//    
//    
//    for (int i = 0 ; i < accessories->amount ; i++)
//    {
//        LPSAIRCONDITIONERINFO acInfo = &accessories->pTagAirConditionerInfo[i];
//        SmartDeviceModel *device = [SmartDeviceModel parseFromInfo: acInfo];
//        
//        [arrDevices addObject: device];
//    }
//    
//    return arrDevices;
//}

//+(instancetype)parseFromInfo: (LPSAIRCONDITIONERINFO)acInfo
//{
//    SmartDeviceModel *device = [[SmartDeviceModel alloc] init];
//    
//    device.aid      = acInfo->AID;
//    device.type     = acInfo->Type;
//    device.fnAmount = acInfo->FunctionAmount;
//    
//    NSMutableArray *arrFnCodes = [[NSMutableArray alloc] init];
//    
//    for (int j = 0; j < acInfo->FunctionAmount ; j++)
//    {
//        LPSAIRCONDITIONERFUNCTIONTYPEINFO fnTypeInfo = &acInfo->pTagAirconditionerFunctionTypeInfo[j];
//        
//        DeviceFunctionCode *fnCode = [DeviceFunctionCode parseFromInfo: fnTypeInfo];
//        fnCode.fnCodeIndex = j;
//        
//        GLog(tUI, @"type: %d, fnCode: %d", device.type, fnCode.fnCode);
//        
//        [arrFnCodes addObject: fnCode];
//    }
//    
//    device.arrFnCodes = arrFnCodes;
//    
//    return device;
//}

//+(NSArray *)parseFromCommand30Accessories:(LPSEDITAIRCONDITIONERMESSAGERECORDING)accessory
//{
//    NSMutableArray *arrDevices = [[NSMutableArray alloc] init];
//    
//    GLog(tUI, @"totalCount:%d", accessory->totalCount);
//    GLog(tUI, @"countIndex:%d", accessory->countIndex);
//    GLog(tUI, @"amount:%d",     accessory->amount);
//    
//    LPSAIRCONDITIONERTIMEQUERYFUNCTIONINFO info = accessory->pTagAirConditionerTimeQueryFunctionInfo;
//    SmartDeviceModel *device = [SmartDeviceModel parseFromCommand30Info:info];
//        
//    [arrDevices addObject: device];
//
//    return arrDevices;
//}
//
//+(instancetype)parseFromCommand30Info:(LPSAIRCONDITIONERTIMEQUERYFUNCTIONINFO)info
//{
//    SmartDeviceModel *device = [[SmartDeviceModel alloc] init];
//    
//    device.aid      = info->AID;
//    device.type     = info->type;
//    device.fnAmount = info->functionCodeAmount;
//    
//    NSMutableArray *arrFnCodes = [[NSMutableArray alloc] init];
//    
//    for (int j = 0; j < info->functionCodeAmount ; j++)
//    {
//        LPSAIRCONDITIONERFUNCTIONCODEINFO typeInfo = &info->pTagAirconditionerFunctionCodeInfo[j];
//        
//        DeviceFunctionCode *fnCode = [DeviceFunctionCode parseFromCommand30Info:typeInfo];
//        fnCode.fnCodeIndex = j;
//        
//        GLog(tUI, @"type: %d, fnCode: %d", device.type, fnCode.fnCode);
//        
//        [arrFnCodes addObject: fnCode];
//    }
//    
//    device.arrFnCodes = arrFnCodes;
//    
//    return device;
//}

@end
