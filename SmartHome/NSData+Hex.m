//
//  NSData (Hex).m
//  SmartHome GCT
//
//  Created by Gavin Chang on 2014/4/1.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import "NSData+Hex.h"

@implementation NSData (Hex)

- (NSString*) stringWithHexBytes
{
    NSMutableString *stringBuffer = [NSMutableString stringWithCapacity:([self length] * 2)];
    const unsigned char *dataBuffer = [self bytes];
	
    for (int i = 0; i < [self length]; ++i)
    {
        [stringBuffer appendFormat:@"%02x", (unsigned int)dataBuffer[ i ]];
    }
	
    return stringBuffer;
}

@end
