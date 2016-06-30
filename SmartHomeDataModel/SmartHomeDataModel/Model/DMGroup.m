//
//  DMGroup.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMGroup.h"


@interface DMGroup ()

@property (nonatomic, strong) NSMutableArray *arrAccessories;

@end


@implementation DMGroup


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
    NSArray *arrAccessories = dict[@"accessories"];
    for (NSDictionary *dict in arrAccessories)
    {
        DMAccessory *accessory = [[DMAccessory alloc] initWithDictionary: dict];
        [arrObjects addObject: accessory];
    }
    
    self.arrAccessories = arrObjects;
}


#pragma mark - /// getter

-(NSString *)keyJsonArray
{
    return kKeyAccessories;
}

-(NSDictionary *)jsonWithArray:(NSArray *)array
{
    NSArray      *arrJsons = [self  jsonArrayFromObjects: array];
    NSDictionary *json     = [super jsonWithArray: arrJsons];
    
    return json;
}


#pragma mark - /// helper

-(DMAccessory *)accessoryAtIndex: (NSUInteger)index
{
    if (index >= self.arrAccessories.count)
    {
        return nil;
    }
    
    DMAccessory *accessory = self.arrAccessories[index];
    
    return accessory;
}

@end
