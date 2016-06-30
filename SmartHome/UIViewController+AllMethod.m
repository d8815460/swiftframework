//
//  UIViewController+AllMethod.m
//  Kalay Home
//
//  Created by jakey on 2015/5/20.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "UIViewController+AllMethod.h"
#import "UIViewController+Background.h"
#import "UIViewController+LeftButton.h"

@implementation UIViewController (AllMethod)

#pragma mark - Method

-(void)allMethod
{
    self.extendedLayoutIncludesOpaqueBars = YES;
    
    [self chagneToCustomBackground];
//    [self leftBarButtonItem];
}

@end
