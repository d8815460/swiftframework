//
//  DeviceFunctionCode.h
//  VetechKalayHome
//
//  Created by jian li on 12/7/15.
//  Copyright © 2015 駿逸 陳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceFunctionCode : NSObject

@property (nonatomic, assign) unsigned int fnCode;
@property (nonatomic, assign) int transferCodeLength;
@property (nonatomic, strong) NSMutableArray* transferCodeArray;

@property (nonatomic, assign) int fnCodeIndex;

//+(instancetype)parseFromInfo: (LPSAIRCONDITIONERFUNCTIONTYPEINFO)fnTypeInfo;
//+(instancetype)parseFromCommand30Info: (LPSAIRCONDITIONERFUNCTIONCODEINFO)fnTypeInfo;
//
//-(FunctionStatus *)covertToFunctionStatus;


@end
