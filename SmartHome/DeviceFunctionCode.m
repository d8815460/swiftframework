//
//  DeviceFunctionCode.m
//  VetechKalayHome
//
//  Created by jian li on 12/7/15.
//  Copyright © 2015 駿逸 陳. All rights reserved.
//

#import "DeviceFunctionCode.h"


@implementation DeviceFunctionCode

- (instancetype) init
{
    if ((self = [super init])) {
        self.transferCodeArray = [[NSMutableArray alloc] init];
    }
    
    return self;
}

//+(instancetype)parseFromInfo: (LPSAIRCONDITIONERFUNCTIONTYPEINFO)fnTypeInfo
//{
//    DeviceFunctionCode *fnCode = [[DeviceFunctionCode alloc] init];
//    
//    for (int k=0 ; k<fnTypeInfo->FunctionCodeAmount ; k++)
//    {
//        unsigned short transferCode = fnTypeInfo->pTagAirconditionerFunctionCodeInfo[k].transferCode;
//        GLog(tUI, @"transferCode: %d", transferCode);
//        
//        [fnCode.transferCodeArray addObject: [NSNumber numberWithUnsignedShort: transferCode]];
//    }
//    
//    fnCode.fnCode             = fnTypeInfo->FunctionCode;
//    fnCode.transferCodeLength = fnTypeInfo->FunctionCodeAmount;
//    
//    return fnCode;
//}

//+(instancetype)parseFromCommand30Info: (LPSAIRCONDITIONERFUNCTIONCODEINFO)fnTypeInfo
//{
//    DeviceFunctionCode *fnCode = [[DeviceFunctionCode alloc] init];
//    
////    for (int k=0 ; k<fnTypeInfo->FunctionCodeAmount ; k++)
////    {
////        unsigned short transferCode = fnTypeInfo->pTagAirconditionerFunctionCodeInfo[k].transferCode;
////        GLog(tUI, @"transferCode: %d", transferCode);
////        
////        [fnCode.transferCodeArray addObject: [NSNumber numberWithUnsignedShort:transferCode]];
////    }
////    
////    fnCode.fnCode             = fnTypeInfo->FunctionCode;
////    fnCode.transferCodeLength = fnTypeInfo->FunctionCodeAmount;
//    
//    return fnCode;
//}

//-(FunctionStatus *)covertToFunctionStatus
//{
//    FunctionStatus *fnStatus = [[FunctionStatus alloc] init];
//    fnStatus.functionCode          = self.fnCode;
//    fnStatus.transferCodeArrayList = [[NSMutableArray alloc] init];
//    
//    for (int i = 0 ; i < self.transferCodeLength ; i++)
//    {
//        int transferCode = [[self.transferCodeArray objectAtIndex:i] unsignedShortValue];
//        GLog(tUI, @"transferCode: %d", transferCode);
//        
//        [fnStatus.transferCodeArrayList addObject: @(transferCode)];
//    }
//    
//    return fnStatus;
//}


@end
