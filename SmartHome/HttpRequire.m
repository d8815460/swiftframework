//
//  HTTPRequest.m
//  KalayHome
//
//  Created by jakey on 2015/9/17.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "HttpRequire.h"

//HttpRequire* g_HttpRequire;

@interface HttpRequire ()

@property (nonatomic, retain) ASIHTTPRequest *request;
@property (nonatomic, assign) enum HttpRequireResponseStatus status;
@property (nonatomic, assign) id<HttpRequireDelegate> delegate;

@end

@implementation HttpRequire

-(id)initWithStats:(enum HttpRequireResponseStatus)status delegate:(id<HttpRequireDelegate>)delegate URL:(NSString*)URLString
{
    self = [super init];
    
    if (self) {
        NSURL *url = [NSURL URLWithString:URLString];
        self.request = [[ASIHTTPRequest alloc] initWithURL:url];
        [self.request setDelegate:self];
        
        self.status = status;
        self.delegate = delegate;
    }
    
    return self;
}

//-(id)initWithStats:(enum HttpRequireResponseStatus)status delegate:(id<HttpRequireDelegate>)delegate URL:(NSString*)URLString
//{
//    
//}

#pragma mark - Normal Method

- (void)startAsynchronous
{
    [self.request startAsynchronous];
}

#pragma mark - ASIHTTPRequestDelegate

- (void)requestFinished:(ASIHTTPRequest *)request
{
    // Use when fetching text data
    NSString *responseString = [request responseString];
//    GLog(tUI, @"responseString");
    
    if (self.status == HttpRequireResponseStatus_Text) {
        if ([self.delegate respondsToSelector:@selector(didReceiveResponseText:)]) {
            [self.delegate didReceiveResponseText:responseString];
        }
        
    }
    else if (self.status == HttpRequireResponseStatus_Json) {
        if ([self.delegate respondsToSelector:@selector(didReceiveResponseJson:)]) {
//            [self.delegate didReceiveResponseJson:nil];
        }
    }
}

- (void)requestFailed:(ASIHTTPRequest *)request
{
    NSError *error = [request error];
//    GLog(tUI, @"error:%@", [error debugDescription]);
    
    [self.delegate didReceiveResponseError:error];
}

@end
