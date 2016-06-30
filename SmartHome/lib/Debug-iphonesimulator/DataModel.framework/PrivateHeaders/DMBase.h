//
//  DMBase.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMBase : NSObject

-(instancetype)initWithDictionary: (NSDictionary *)dict;
-(void)updateWithDictionary: (NSDictionary *)dict;


+(NSError *)errorWithCode: (NSInteger)code
           andDescription: (NSString *)description;

+(NSDictionary *)loadJsonFromFile: (NSString *)filename;

@end
