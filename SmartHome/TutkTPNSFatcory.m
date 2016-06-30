//
//  TutkTPNSFatcory.m
//  SmartHome GCT
//
//  Created by Gavin Chang on 2014/4/1.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import "TutkTPNSFatcory.h"
#import "NSData+Hex.h"
#import "Utility.h"
#import "HttpRequire.h"

#define DEF_TPNS_API_URL 		@"http://push.iotcplatform.com/apns/"
//#define DEF_TPNS_API_URL      @"http://push.iotcplatform.com/apns/"

static NSString* smDeviceTokenString;
static TutkTPNSFatcory* g_TutkTPNSFatcory;

@interface TutkTPNSFatcory ()

//@property (nonatomic, retain) HttpRequire* httpRequire;

@end

@implementation TutkTPNSFatcory

@synthesize smDeviceTokenString;

#pragma mark - Singleton Implementation


- (id) init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

+ (TutkTPNSFatcory*)sharedTutkTPNSFatcory
{
    if (g_TutkTPNSFatcory == nil) {
        g_TutkTPNSFatcory = [[super allocWithZone:NULL] init];
    }
    
    return g_TutkTPNSFatcory;
}

#pragma mark - Public Method

+ (NSString *)getLangCode
{
    
    NSArray *languages = [NSLocale preferredLanguages];
    NSDictionary *dict = [NSDictionary dictionaryWithObjectsAndKeys:
                          @"zh_TW", @"zh-Hant", @"en_US", @"en", @"fr_FR", @"fr",
                          @"de_DE", @"de", @"zh_CN", @"zh-Hans", @"ja_JP", @"ja",
                          @"nl_NL", @"nl", @"it_IT", @"it", @"es_ES", @"es",nil];
    
    NSString *code = [dict objectForKey:[languages objectAtIndex:0]];
    if ( nil == code) {
        code = @"en_US";
    }
    
    return code;
}

+ (void)clientWithToken:(NSData *)deviceToken appClientReadyDelegate:(id<TutkTPNSAppClientReadyDelegate>)delegate
{
	smDeviceTokenString = [deviceToken stringWithHexBytes];
	
    //NSString *identifier = [[NSLocale currentLocale] localeIdentifier];
    //NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:identifier];
    //NSArray *languages = [NSLocale preferredLanguages];
    
    NSString *systemVer = [[UIDevice currentDevice] systemVersion] ;
    NSString *appVer = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
    NSString *appidString = [[NSBundle mainBundle] bundleIdentifier];
    NSString *deviceType = [[UIDevice currentDevice] model];
    NSString *encodeUrl = [deviceType stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSString *uuid = [[[ UIDevice currentDevice] identifierForVendor] UUIDString];
    
    NSString *langCode = [self getLangCode];
	
    dispatch_queue_t queue = dispatch_queue_create("apns-reg_client", NULL);
    dispatch_async(queue, ^{
        
		NSString *hostString = [NSString stringWithFormat:@"%@apns.php", DEF_TPNS_API_URL];
		
#if DEBUG
        NSString *argsString = @"%@?cmd=reg_client&token=%@&appid=%@&dev=1&lang=%@&udid=%@&os=ios&osver=%@&appver=%@&model=%@";
#else
        NSString *argsString = @"%@?cmd=reg_client&token=%@&appid=%@&dev=0&lang=%@&udid=%@&os=ios&osver=%@&appver=%@&model=%@";
#endif
		
        NSString *getURLString = [NSString stringWithFormat:argsString, hostString, smDeviceTokenString, appidString, langCode , uuid, systemVer , appVer, encodeUrl];
        
        
        NSURL *url = [NSURL URLWithString:getURLString];
        __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        __block NSError *error = nil;
        
        [request setCompletionBlock:^{
            // Use when fetching text data
//            NSString *responseString = [request responseString];
//            GLog(tUI, @"reg_mapping:%@", responseString);
            
			if( delegate != nil ) {
				[delegate onTPNSAppClientRegisterSuccess];
			}
        }];
        
        [request setFailedBlock:^{
            error = [request error];
//            GLog(tUI, @"error:%@", error);
            
            if( delegate != nil ) {
				[delegate onTPNSAppClientRegisterFailed];
			}
        }];
        
        [request startAsynchronous];
    });
    
//    dispatch_release(queue);
}

+ (BOOL)mappingWithUid:(NSString*)strUid
{
	if (smDeviceTokenString != nil) {
		NSString *uuid = [[[ UIDevice currentDevice] identifierForVendor] UUIDString];
		NSString *appidString = [[NSBundle mainBundle] bundleIdentifier];
        
        NSString *hostString = [NSString stringWithFormat:@"%@apns.php", DEF_TPNS_API_URL];
		NSString *argsString = @"%@?cmd=reg_mapping&token=%@&uid=%@&appid=%@&udid=%@&os=ios&interval=0";
		NSString *getURLString = [NSString stringWithFormat:argsString, hostString, smDeviceTokenString, strUid, appidString , uuid];
        
//		GLog(tUI, @"getURLString:%@ uid:%@", getURLString, uid);

        NSURL *url = [NSURL URLWithString:getURLString];
        __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
        
        __block NSError *error = nil;
        [request setCompletionBlock:^{
            // Use when fetching text data
//            NSString *responseString = [request responseString];
//            GLog(tUI, @"reg_mapping:%@ uid:%@", responseString, uid);
        }];
        
        [request setFailedBlock:^{
            error = [request error];
//            GLog(tUI, @"error:%@", error);
        }];
        
        [request startAsynchronous];
        
		return TRUE;
	}
	else {
        
		return FALSE;
	}
}

+ (BOOL)unmappingWithUid:(NSString*)strUid
{
	NSString *uuid = [[[ UIDevice currentDevice] identifierForVendor] UUIDString];
	NSString *appidString = [[NSBundle mainBundle] bundleIdentifier];
    
	NSString *hostString = [NSString stringWithFormat:@"%@apns.php", DEF_TPNS_API_URL];
	NSString *argsString = @"%@?cmd=unreg_mapping&uid=%@&appid=%@&udid=%@&os=ios";
	NSString *getURLString = [NSString stringWithFormat:argsString, hostString, strUid, appidString, uuid];
	
//	GLog(tUI, @"unreg_mapping:%@ uid:%@", getURLString, uid);
	
    NSURL *url = [NSURL URLWithString:getURLString];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __block NSError *error = nil;
    
    [request setCompletionBlock:^{
        // Use when fetching text data
//        NSString *responseString = [request responseString];
//        GLog(tUI, @"reg_mapping:%@ uid:%@", responseString, uid);
    }];
    
    [request setFailedBlock:^{
        error = [request error];
//        GLog(tUI, @"error:%@", error);
    }];
    
    [request startAsynchronous];
    
    return YES;
}

+ (BOOL)unmappingAllUid
{
//    GLog(tUI, @"unmappingAllUid");
    
    NSString *uuid = [[[ UIDevice currentDevice] identifierForVendor] UUIDString];
    NSString *appidString = [[NSBundle mainBundle] bundleIdentifier];
    
    NSString *hostString = [NSString stringWithFormat:@"%@apns.php", DEF_TPNS_API_URL];
    NSString *argsString = @"%@?cmd=unreg_mapping&appid=%@&udid=%@&os=ios";
    NSString *getURLString = [NSString stringWithFormat:argsString, hostString, appidString, uuid];
    
//    GLog(tUI, @"unreg_mapping:%@", getURLString);
    
    NSURL *url = [NSURL URLWithString:getURLString];
    __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
    __block NSError *error = nil;
    
    [request setCompletionBlock:^{
        // Use when fetching text data
//        NSString *responseString = [request responseString];
//        GLog(tUI, @"reg_mapping:%@", responseString);
    }];
    
    [request setFailedBlock:^{
        error = [request error];
//        GLog(tUI, @"error:%@", error);
    }];
    
    [request startAsynchronous];
    
    return YES;
}

//+ (void)mappingWithUid:(NSString*)uid interval:(int)interval
//{
//    if (!uid) return;
//    
//    //TODO: 資料要同步到Home的資料
//
//    
//    //TPNS
//    NSString *uuid = [[[ UIDevice currentDevice] identifierForVendor] UUIDString];
//    
//    // register to apns server
//    dispatch_queue_t queue = dispatch_queue_create("apns-reg_client", NULL);
//    dispatch_async(queue, ^{
//        //TODO: 這邊拿到的smDeviceTokenString都是空的,請檢查一下
//        
//        NSLog(@"smDeviceTokenString = %@",smDeviceTokenString);
//        
//        if (smDeviceTokenString != nil)
//        {
//            NSString *appidString = [[NSBundle mainBundle] bundleIdentifier];
//            
//            NSString *hostString = [NSString stringWithFormat:@"%@apns.php", DEF_TPNS_API_URL];
//            NSString *argsString = @"%@?cmd=reg_mapping&token=%@&uid=%@&appid=%@&udid=%@&os=ios";
//            NSString *getURLString = [NSString stringWithFormat:argsString, hostString, smDeviceTokenString, uid, appidString , uuid];
//
//            NSLog( @"==============================================");
//            NSLog( @"stringWithContentsOfURL ==> %@", getURLString );
//            NSLog( @"==============================================");
//
//            NSURL *url = [NSURL URLWithString:getURLString];
//            __block ASIHTTPRequest *request = [ASIHTTPRequest requestWithURL:url];
//            __block NSError *error = nil;
//            
//            [request setCompletionBlock:^{
//                // Use when fetching text data
//                NSString *responseString = [request responseString];
//                GLog(tUI, @"reg_mapping:%@ uid:%@", responseString, uid);
//            }];
//            
//            [request setFailedBlock:^{
//                error = [request error];
//                GLog(tUI, @"error:%@", error);
//            }];
//            
//            [request startAsynchronous];
//        }
//    });
//
////    dispatch_release(queue);
//}

@end
