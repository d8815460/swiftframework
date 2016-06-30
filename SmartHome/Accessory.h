//
//  Accessory.h
//  SmartHome Master
//
//  Created by jakey on 2015/1/16.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Accessory : NSObject

@property (assign, nonatomic) int accessoryId;
@property (retain, nonatomic) NSString* uid;
@property (assign, nonatomic) int aid;
@property (assign, nonatomic) int type;

@end
