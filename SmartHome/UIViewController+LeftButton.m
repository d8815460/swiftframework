//
//  UIViewController+LeftButton.m
//  SmartHome Master
//
//  Created by jakey on 2014/12/2.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import "UIViewController+LeftButton.h"

//@implementation UIViewController (LeftBarButtonItem)
//
//-(void)leftBarButtonItem
//{
//    // 清除
////    self.navigationItem.leftBarButtonItems = nil;
//    
//    // 左上角按鈕
//    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    backButton.frame = CGRectMake(0, 0, 34, 34); // 原本44圖太大 改成34 感應區塊不會改變
//    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_n" ] forState:UIControlStateNormal];
//    [backButton setBackgroundImage:[UIImage imageNamed:@"btn_back_h"] forState:UIControlStateHighlighted];
//    //backButton.imageEdgeInsets = UIEdgeInsetsMake(10, 10, 10, 10); // 在navigation內無效
//    [backButton addTarget:self action:@selector(backButtonAction:) forControlEvents:UIControlEventTouchUpInside];
//    
//    // 微調左上角按鈕位置
//    //    UIBarButtonItem *negativeSpacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
//    //    [negativeSpacer setWidth:-10];
//    // 加入navigationItem
//    
//    UIBarButtonItem * backBBItem = [[UIBarButtonItem alloc] initWithCustomView:backButton];
//
//    self.navigationItem.leftBarButtonItem = backBBItem;
////    [backBBItem release];
////    self.navigationItem.leftBarButtonItems = [NSArray arrayWithObjects:/*negativeSpacer, */backBBItem, nil];
//    [self.navigationItem.leftBarButtonItem setImage:[UIImage imageNamed:@"btn_back_n.png"]];
//}
//
//#pragma mark - Actions
//
//- (IBAction) backButtonAction:(UIButton *)sender
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}
//
//@end
