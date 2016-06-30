//
//  SmartDevUtility.h
//  SmartHome Master
//
//  Created by RD1-Gavin on 2014/11/26.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DeviceUtility : NSObject

+ (NSArray*)makeSearchDevsByClassCode:(NSArray*)aMatchArrClassCode;
//+ (SmartDevBase*)makeSearchDevsByUID:(NSString*)uid;

//+ (NSArray*)makeSearchGroupDevsByGrouopID:(int)groupId;
+ (int) typeByClassCode:(unsigned short)classCode;

@end
