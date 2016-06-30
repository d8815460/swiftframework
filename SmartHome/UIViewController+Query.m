//
//  UIViewController+Query.m
//  KalayHome
//
//  Created by jakey on 2015/10/6.
//  Copyright © 2015年 TUTK. All rights reserved.
//

#import "UIViewController+Query.h"

@implementation UIViewController (Query)

#pragma mark - Method

- (void)queryAll:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray
{
//    [self queryAllWithReturn:functionCode transferCodeLength:transferCodeLength transferCodeArray:pTransferCodeArray];
}

//- (void)queryAll:(FunctionStatus*)functionStatus
//{
//    [self queryAllWithReturn:functionStatus];
//}

//- (BOOL)queryAllWithReturn:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray
//{
//    FunctionStatus *functionStatus = [[FunctionStatus alloc] init];
//    functionStatus.functionCode = functionCode;
//    functionStatus.transferCodeArrayList = [NSMutableArray arrayWithCapacity:5];
//    
//    for (int i=0 ; i<transferCodeLength ; i++) {
//        int transferCode = pTransferCodeArray[i];
//        
//        [functionStatus.transferCodeArrayList addObject:[NSNumber numberWithInt:transferCode]];
//    }
//    
//    return [self queryAllWithReturn:functionStatus];
//}

//- (BOOL)queryAllWithReturn:(FunctionStatus*)functionStatus
//{
//    return [self query:functionStatus];
//}

// 必須實作
//- (BOOL)query:(FunctionStatus*)functionStatus
//{
//    return NO;
//}


- (void)queryAll:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray withType:(int)type
{
//    [self queryAllWithReturn:functionCode transferCodeLength:transferCodeLength transferCodeArray:pTransferCodeArray withType:type];
}

//- (void)queryAll:(FunctionStatus*)functionStatus withType:(int)type
//{
//    [self queryAllWithReturn:functionStatus withType:type];
//}
//
//- (BOOL)queryAllWithReturn:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength transferCodeArray:(unsigned short[])pTransferCodeArray withType:(int)type
//{
//    FunctionStatus *functionStatus = [[FunctionStatus alloc] init];
//    functionStatus.functionCode = functionCode;
//    functionStatus.transferCodeArrayList = [NSMutableArray arrayWithCapacity:5];
//    
//    for (int i=0 ; i<transferCodeLength ; i++) {
//        int transferCode = pTransferCodeArray[i];
//        
//        [functionStatus.transferCodeArrayList addObject:[NSNumber numberWithInt:transferCode]];
//    }
//    
//    return [self queryAllWithReturn:functionStatus withType:type];
//}
//
//- (BOOL)queryAllWithReturn:(FunctionStatus*)functionStatus withType:(int)type
//{
//    return [self query:functionStatus withType:type];
//}
//
//// 必須實作
//- (BOOL)query:(FunctionStatus*)functionStatus withType:(int)type
//{
//    return NO;
//}

@end
