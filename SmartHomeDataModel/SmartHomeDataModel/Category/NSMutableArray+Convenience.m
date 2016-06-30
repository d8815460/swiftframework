//
//  NSMutableArray+Convenience.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/13/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "NSMutableArray+Convenience.h"

@implementation NSMutableArray (Convenience)

- (void)moveObjectAtIndex:(NSUInteger)fromIndex
                  toIndex:(NSUInteger)toIndex
{
    // Optional toIndex adjustment if you think toIndex refers to the position in the array before the move (as per Richard's comment)
    if (fromIndex < toIndex)
    {
        toIndex--; // Optional
    }
    
    id object = [self objectAtIndex: fromIndex];
    
    [self removeObjectAtIndex: fromIndex];
    
    [self insertObject: object
               atIndex: toIndex];
}

@end
