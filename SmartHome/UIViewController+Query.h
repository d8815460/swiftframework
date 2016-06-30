//
//  UIViewController+Query.h
//  KalayHome
//
//  Created by jakey on 2015/10/6.
//  Copyright © 2015年 TUTK. All rights reserved.
//

#import <UIKit/UIKit.h>
//#import "FunctionStatus.h"

@interface UIViewController (Query)

- (void)queryAll:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray;
//- (void)queryAll:(FunctionStatus*)functionStatus;

//- (BOOL)queryAllWithReturn:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray;
//- (BOOL)queryAllWithReturn:(FunctionStatus*)functionStatus;
//- (BOOL)query:(FunctionStatus*)functionStatus;

- (void)queryAll:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray withType:(int)type;
//- (void)queryAll:(FunctionStatus*)functionStatus withType:(int)type;

//- (BOOL)queryAllWithReturn:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray withType:(int)type;
//- (BOOL)queryAllWithReturn:(FunctionStatus*)functionStatus withType:(int)type;
//- (BOOL)query:(FunctionStatus*)functionStatus withType:(int)type;

@end
