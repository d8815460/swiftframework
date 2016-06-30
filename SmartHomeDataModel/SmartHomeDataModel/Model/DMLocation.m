//
//  DMLocation.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMLocation.h"
#import "DMBaseAccessory.h"


@interface DMLocation ()

@property (nonatomic, strong) NSMutableArray *arrAccessories;

@end


@implementation DMLocation

-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    self = [super initWithDictionary: dict];
    
    [self updateWithDictionary: dict];
    
    return self;
}

-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
    
    NSMutableArray *arrObjects = [[NSMutableArray alloc] init];
    
    // accessories
    NSArray *arrAccessories = dict[kKeyAccessories];
    for (NSDictionary *dictAccessory in arrAccessories)
    {
        NSUInteger type = [dictAccessory[kKeyType] integerValue];
        if (type == AccessoryGroup)
        {
            DMGroup *group = [[DMGroup alloc] initWithDictionary: dictAccessory];
            [arrObjects addObject: group];
        }
        else
        {
            DMAccessory *accessory = [[DMAccessory alloc] initWithDictionary: dictAccessory];
            [arrObjects addObject: accessory];
        }
    }
    
    self.arrAccessories = arrObjects;
}


#pragma mark - /// getter

-(NSString *)keyJsonArray
{
    return kKeyAccessories;
}


#pragma mark - /// helper

-(DMBaseAccessory *)accessoryAtIndex: (NSUInteger)index
{
    if (index >= self.arrAccessories.count)
    {
        return nil;
    }
    
    DMBaseAccessory *accessory = self.arrAccessories[index];
    
    return accessory;
}

//-(NSArray *)getObjects
//{
//    NSMutableArray *arrObjects = [[NSMutableArray alloc] initWithArray: self.arrAccessories];
//    
//    [arrObjects addObjectsFromArray: self.arrGroups];
//    
//    // sort arrObject by index
//    
//    
//    return arrObjects;
//}


@end
