//
//  SmartDeviceModel.h
//  DragAndDrop
//
//  Created by 駿逸 陳 on 2015/11/18.
//  Copyright © 2015年 駿逸 陳. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SmartDeviceModel : NSObject

@property (nonatomic, assign) NSString *uid;
@property (nonatomic, assign) int aid;
@property (nonatomic, assign) int type;
@property (nonatomic, assign) NSString *name;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int locationIndex;
@property (nonatomic, assign) NSString *locationName;
@property (nonatomic, assign) int index;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSMutableArray *models; //group 才有
@property (nonatomic, assign) BOOL isTurnOn;
@property (nonatomic, assign) BOOL isHide;

@property (nonatomic, assign) int fnAmount;
@property (nonatomic, strong) NSArray *arrFnCodes;  // DeviceFunctionCode


- (instancetype)initWithUid:(NSString *)uid
                     AndAid:(int)aid
                    AndType:(int)type
                    AndNmae:(NSString *)name
            atLocationIndex:(int)locationIndex
                  withIndex:(int)index;

//+(NSArray *)parseFromAccessories: (LPSAIRCONDITIONERACCESSORYITEM)accessories;
//+(NSArray *)parseFromCommand30Accessories:(LPSEDITAIRCONDITIONERMESSAGERECORDING)accessories;
//
//+(instancetype)parseFromInfo: (LPSAIRCONDITIONERINFO)acInfo;

@end
