//
//  DMAccount.m
//  SmartHomeDataModel
//
//  Created by jian li on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMAccount.h"

@implementation DMAccount

-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    DMAccount *account = [super initWithDictionary: dict];
    
    return account;
}

@end
