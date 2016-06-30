//
//  FunctionInfo.h
//  VetechKalayHome
//
//  Created by jakey on 2015/12/22.
//  Copyright © 2015年 駿逸 陳. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FunctionInfo : NSObject

@property (assign, nonatomic) int aid;
@property (assign, nonatomic) int type;

@property (strong, nonatomic) NSArray* functionStatusList; // FunctionStatus

@end
