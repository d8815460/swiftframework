//
//  DMGroup.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMAccessory.h"


@class DMGroup;


typedef void (^DMGroupResult) (DMGroup *group);


@interface DMGroup : DMBaseAccessory

@property (nonatomic, readonly) NSMutableArray *arrAccessories;


#pragma mark - /// helper

-(DMAccessory *)accessoryAtIndex: (NSUInteger)index;

@end
