//
//  Database.h
//  WinG_APP
//
//  Created by jakey_lee on 14/2/18.
//  Copyright (c) 2014年 ChaLin LEE. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FMDatabase.h"

@interface Database : NSObject
{
    
}

@property (nonatomic, retain) FMDatabase *fmdb;

+ (Database*)sharedDatabase;

- (void) initDatabase;
- (void) openDatabase;
- (void) closeDatabase;
- (void) removeDatabase;

@end
