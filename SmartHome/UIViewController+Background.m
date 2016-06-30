//
//  UIViewController+Background.m
//  SmartHome Master
//
//  Created by jakey on 2014/11/27.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import "UIViewController+Background.h"

@implementation UIViewController (BackgroundImage)

// 改變底圖顏色與增加底圖
// 圖片在最右上角
// viewcontroller的底顏色為 254 253 252
-(void)chagneToCustomBackground
{
    self.navigationController.edgesForExtendedLayout = UIRectEdgeNone;
    UIImage *image = nil;
    if ([[self.view subviews][0] isKindOfClass:UITableView.class]) {
        image = [UIImage imageNamed:@"bg_all"];
    } else if ([[self.view subviews][0] isKindOfClass:UICollectionView.class]) {
        image = [UIImage imageNamed:@"bg_all"];
    } else {
        image = [UIImage imageNamed:@"bg"];
    }
    
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8) {
        imageView.frame = CGRectMake(self.view.frame.size.width - imageView.frame.size.width,
                                     0 + 64, imageView.frame.size.width, imageView.frame.size.height);
    } else {
        imageView.frame = CGRectMake(self.view.frame.size.width - imageView.frame.size.width,
                                     0 + 44, imageView.frame.size.width, imageView.frame.size.height);
    }
    
    self.view.backgroundColor = [UIColor colorWithRed:248/255.0 green:245/255.0 blue:241/255.0 alpha:1.0];
    
    if ([[self.view subviews][0] isKindOfClass:UITableView.class]) {
        UITableView *tableView = [self.view subviews][0];
        tableView.backgroundView = imageView;
    } else if ([[self.view subviews][0] isKindOfClass:UICollectionView.class]) {
        UICollectionView *collectionView = [self.view subviews][0];
        collectionView.backgroundView = imageView;
    } else {
        [self.view insertSubview:imageView atIndex:0];
    }
    
//    NSArray *subviews = [self.view subviews];
//    for (UIView *view in subviews) {
//        GLog(tUI, @"view:%@", view);
//    }
    
//    [imageView release];
}

@end
