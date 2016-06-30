//
//  DMBaseGateway.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseGateway.h"
#import "NSDictionary+JSONString.h"

#include "kalay_device.h"

#define kMaxByteSize    8192    // = 8 KB
#define kTimeOutTime    10000


@interface DMBaseGateway ()

@property (nonatomic, strong) NSString   *identity;
@property (nonatomic, strong) NSString   *name;
@property (nonatomic, assign) NSUInteger  index;


@end


@implementation DMBaseGateway


-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
    
    self.identity  = dict[kKeyIdentity];
    self.name      = dict[kKeyName];
    
    if (dict[kKeyIndex])
    {
        self.index = [dict[kKeyIndex] integerValue];
    }
}

+(NSArray *)parseWithDictionary: (NSDictionary *)dict
                           keys: (NSArray      *)arrKeys
                     andClasses: (NSArray      *)arrClasses
{
    NSMutableArray *arrObjects = [[NSMutableArray alloc] init];
    
    for (int i = 0; i < arrKeys.count; i++)
    {
        id class = arrClasses[i];
        NSArray *array = dict[arrKeys[i]];
        
        for (NSDictionary *dict in array)
        {
            [arrObjects addObject: [class initWithDictionary: dict]];
        }
    }
             
    return arrObjects;
}


#pragma mark - /// getter

-(NSString *)keyJsonArray
{
    return nil;
}


#pragma mark - /// json

-(NSDictionary *)json
{
    NSDictionary *dict = @{kKeyIdentity: self.identity};
    
    return dict;
}

-(NSDictionary *)jsonWithArray: (NSArray *)array
{
    NSDictionary *json = [self jsonWithDictionary: @{self.keyJsonArray: array}];
    
    return json;
}

-(NSDictionary *)jsonWithDictionary: (NSDictionary *)dict
{
    NSMutableDictionary *json = [[self json] mutableCopy];
    
    [json addEntriesFromDictionary: dict];
    
    return json;
}

-(NSDictionary *)jsonWithKeys: (NSArray *)arrKeys
                    andValues: (NSArray *)arrValues
{
    if (arrKeys.count != arrValues.count)
    {
        return nil;
    }
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc] init];
    
    for (int i = 0; i <= arrKeys.count; i++)
    {
        [dict addEntriesFromDictionary: @{arrKeys[i]: arrValues[i]}];
    }
    
    NSDictionary *json = [self jsonWithDictionary: dict];
    
    return json;
}

-(NSArray *)jsonArrayFromObjects: (NSArray *)arrObjects
{
    NSMutableArray *arrJsons = [[NSMutableArray alloc] init];
    
    for (DMBaseGateway *object in arrObjects)
    {
        [arrJsons addObject: [object json]];
    }
    
    return arrObjects;
}


#pragma mark - /// request helper

-(void)requestWithApi: (NSString     *)api
        andDictionary: (NSDictionary *)dict
           errorBlock: (ErrorHandle   )errorBlock
{
    NSMutableDictionary *dictJson = [dict mutableCopy];
    [dictJson addEntriesFromDictionary: @{kKeyApi: api}];
    
    NSDictionary *json = [self jsonWithDictionary: dictJson];
    
    [DMBaseGateway requestWithDictionary: json
                         completionBlock: ^(NSDictionary *response) {
                             
                             [self updateWithDictionary: response];
                             
                             errorBlock(nil);
                         }
                              errorBlock: ^(NSError *error) {
                                  
                                  errorBlock(error);
                              }];
}


#pragma mark - /// request

+(void)notificationWithCompletionBlock: (ResponseResult)completionBlock
                            errorBlock: (ErrorHandle   )errorBlock
{
    /*
     *
     *  int kalay_device_message(char *buffer ,
                                 int   buffer_size);
     */
    
    char response[kMaxByteSize] = {0};

    int result = -1;
    
    // TODO: implement the followings
    result = kalay_device_message(response,
                                  kMaxByteSize);

    NSLog(@"result = %d", result);
    
    if (result == ResponseCodeSuccess)
    {
        NSDictionary *dictJson = [DMBaseGateway jsonFromCharArray: response];
        
        completionBlock(dictJson);
    }
    else if (result == ResponseCodeError)
    {
        NSError *error = [super errorWithCode: result
                               andDescription: @"Error occurred"];
        
        errorBlock(error);
    }
}

+(void)requestWithDictionary: (NSDictionary  *)dict
             completionBlock: (ResponseResult )completionBlock
                  errorBlock: (ErrorHandle    )errorBlock
{
    NSLog(@"json: %@", dict);
    /*
     *
     *  int kalay_device_control(char *command,
                                 int   lenght,
                                 char *response_buffer,
                                 int   buffer_size,
                                 int   timeout);
     */
    
    char *command  = [DMBaseGateway charArrayFromDictionary: dict];
    char response[kMaxByteSize] = {0};
    int timeout = kTimeOutTime;
    
    int result = -1;
    kalay_device_start();
    
    // TODO: implement the followings
    result = kalay_device_control(command,
                                  strlen(command),
                                  response,
                                  kMaxByteSize,
                                  timeout);
    
    NSLog(@"command len = %d", strlen(command));
    NSLog(@"result = %d", result);
    NSLog(@"response: %s", response);
    
    if (result > 0)
    {
        NSDictionary *dictJson = [DMBaseGateway jsonFromCharArray: response];
        
        completionBlock(dictJson[@"response"]);
    }
    else
    {
        NSError *error = [super errorWithCode: result
                               andDescription: @"Error occurred"];
        
        errorBlock(error);
    }
}


#pragma mark - /// helper

+(id)jsonFromCharArray: (char *)charArray
{
    NSString *jsonString = [NSString stringWithUTF8String: charArray];
    NSData   *data       = [jsonString dataUsingEncoding: NSUTF8StringEncoding];
    
    id json = [NSJSONSerialization JSONObjectWithData: data
                                              options: 0
                                                error: nil];
    
    return json;
}

+(char *)charArrayFromDictionary: (NSDictionary *)dict
{
    NSString *json = [dict jsonStringWithPrettyPrint: NO];
    
    char *charArray = (char *)[json UTF8String];
    
    return charArray;
}


@end
