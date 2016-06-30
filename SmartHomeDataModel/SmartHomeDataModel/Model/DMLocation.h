//
//  DMLocation.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMGroup.h"
#import "DMAccessory.h"


@class DMLocation;


typedef void (^DMLocationResult) (DMLocation *location);


@interface DMLocation : DMBaseGateway

@property (nonatomic, readonly) NSMutableArray *arrAccessories;


#pragma mark - /// helper

-(DMBaseAccessory *)accessoryAtIndex: (NSUInteger)index;

@end
