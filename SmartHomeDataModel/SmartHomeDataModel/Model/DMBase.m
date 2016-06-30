//
//  DMBase.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBase.h"

@implementation DMBase


#pragma mark - /// init

-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    self = [super init];
    
    return self;
}

-(void)updateWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
}


#pragma mark - /// class methods

+(NSError *)errorWithCode: (NSInteger)code
           andDescription: (NSString *)description
{
    NSDictionary *dictUserInfo = @{@"description": description};
    
    NSError *error = [NSError errorWithDomain: @"com.tutk.smarthome.2"
                                         code: code
                                     userInfo: dictUserInfo];
    
    return error;
}

+(NSDictionary *)loadJsonFromFile: (NSString *)filename
{
    NSError  *error    = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource: filename
                                                         ofType: @"json"];
    NSData   *data     = [NSData dataWithContentsOfFile: filePath];
    
    NSDictionary *json = [NSJSONSerialization JSONObjectWithData: data
                                                         options: kNilOptions
                                                           error: &error];
    
    if (error != nil)
    {
        NSLog(@"Error: invalid json file or was not able to load %@.json file.", filename);
        
        return nil;
    }
    
    return json;
}


@end
