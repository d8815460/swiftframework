//
//  DMActivity.m
//  SmartHomeDataModel
//
//  Created by jian li on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMActivity.h"

@implementation DMActivity

-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    self = [super initWithDictionary: dict];
    
    return self;
}

-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
}


@end
