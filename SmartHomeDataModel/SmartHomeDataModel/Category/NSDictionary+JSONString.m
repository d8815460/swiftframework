//
//  NSDictionary+JSONString.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/13/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "NSDictionary+JSONString.h"

@implementation NSDictionary (JSONString)

-(NSString *)jsonStringWithPrettyPrint: (BOOL)prettyPrint
{
    NSError *error;
    NSData  *jsonData = [NSJSONSerialization dataWithJSONObject: self
                                                        options: (NSJSONWritingOptions) (prettyPrint ? NSJSONWritingPrettyPrinted : 0)
                                                          error: &error];
    
    if (!jsonData)
    {
        NSLog(@"jsonStringWithPrettyPrint: error: %@", error.localizedDescription);
        
        return nil;
    }
    else
    {
        NSString *jsonString = [[NSString alloc] initWithData: jsonData
                                                     encoding: NSUTF8StringEncoding];
        return jsonString;
    }
}

@end
