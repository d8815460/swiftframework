//
//  HTTPRequest.h
//  KalayHome
//
//  Created by jakey on 2015/9/17.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"

enum HttpRequireResponseStatus
{
    HttpRequireResponseStatus_Text,
    HttpRequireResponseStatus_Json,
};

@protocol HttpRequireDelegate <NSObject>

@required
-(void)didReceiveResponseError:(NSError*)error;

@optional
-(void)didReceiveResponseText:(NSString*)text;
-(void)didReceiveResponseJson:(NSDictionary*)json;

@end

@interface HttpRequire : NSObject <ASIHTTPRequestDelegate>

-(id)initWithStats:(enum HttpRequireResponseStatus)status delegate:(id<HttpRequireDelegate>)delegate URL:(NSString*)URLString;

@end
