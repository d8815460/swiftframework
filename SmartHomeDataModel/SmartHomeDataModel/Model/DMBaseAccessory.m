//
//  DMBaseAccessory.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/13/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseAccessory.h"

@implementation DMBaseAccessory


-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
    
    self.status    = [dict[kKeyStatus]    integerValue];
    self.type      = [dict[kKeyType]      integerValue];
    self.trigger   = [dict[kKeyTrigger]   integerValue];
}


#pragma mark - /// getter

-(NSDictionary *)json
{
    NSMutableDictionary *json = [[super json] mutableCopy];
    
    NSDictionary *dict = @{kKeyStatus: @(self.status),
                           kKeyType: @(self.type),
                           kKeyTrigger: @(self.trigger)};
    
    [json addEntriesFromDictionary: dict];
    
    return dict;
}


@end
