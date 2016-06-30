//
//  TutkTPNSFatcory.h
//  SmartHome GCT
//
//  Created by Gavin Chang on 2014/4/1.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol TutkTPNSAppClientReadyDelegate <NSObject>

- (void)onTPNSAppClientRegisterSuccess;
- (void)onTPNSAppClientRegisterFailed;

@end

@interface TutkTPNSFatcory : NSObject {
	
}

@property (nonatomic,copy) NSString* smDeviceTokenString;

+ (TutkTPNSFatcory*)sharedTutkTPNSFatcory;

+ (NSString *)getLangCode;

+ (void)clientWithToken:(NSData *)deviceToken appClientReadyDelegate:(id<TutkTPNSAppClientReadyDelegate>)delegate;
+ (BOOL)mappingWithUid:(NSString*)strUid;
+ (BOOL)unmappingWithUid:(NSString*)strUid;
+ (BOOL)unmappingAllUid;
+ (void)mappingWithUid:(NSString*)uid :(int)interval;

@end
