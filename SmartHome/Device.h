//
//  Device.h
//  SmartHome Master
//
//  Created by jakey on 2014/11/19.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Device : NSObject

@property (assign, nonatomic) int deviceId;
@property (retain, nonatomic) NSString *uid;
@property (assign, nonatomic) unsigned short classCode;
@property (retain, nonatomic) NSString *productName;
@property (retain, nonatomic) NSString *name;
@property (retain, nonatomic) NSString *password;
@property (assign, nonatomic) int locationId;
//@property (assign, nonatomic) int type;
@end
