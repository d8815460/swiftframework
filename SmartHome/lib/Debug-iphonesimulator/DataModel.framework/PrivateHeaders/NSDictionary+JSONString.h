//
//  NSDictionary+JSONString.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/13/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (JSONString)

-(NSString *)jsonStringWithPrettyPrint: (BOOL)prettyPrint;

@end
