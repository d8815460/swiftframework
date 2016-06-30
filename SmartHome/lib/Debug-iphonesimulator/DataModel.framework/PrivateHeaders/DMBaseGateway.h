//
//  DMBaseGateway.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBase.h"
#import "NSMutableArray+Convenience.h"
#import "APIs.h"


typedef enum
{
    ResponseCodeSuccess,
    ResponseCodeError
}ResponseCode;


// blocks
typedef void (^ResponseResult) (NSDictionary *response);
typedef void (^ErrorHandle   ) (NSError      *error);
typedef void (^SuccessBlock  ) (BOOL          success);

@interface DMBaseGateway : DMBase

@property (nonatomic, readonly) NSString   *identity;
@property (nonatomic, readonly) NSString   *name;
@property (nonatomic, readonly) NSUInteger  index;

// TODO: rename the following method
-(NSString *)keyJsonArray;

// json
-(NSDictionary *)json;
-(NSDictionary *)jsonWithArray: (NSArray *)array;
-(NSDictionary *)jsonWithDictionary: (NSDictionary *)dict;
-(NSDictionary *)jsonWithKeys: (NSArray *)arrKeys
                    andValues: (NSArray *)arrValues;
// TODO: rename the following method
-(NSArray *)jsonArrayFromObjects: (NSArray *)arrObjects;


// testing/unstable class method
+(NSArray *)parseWithDictionary: (NSDictionary *)dict
                           keys: (NSArray      *)arrKeys
                     andClasses: (NSArray      *)arrClasses;


-(void)requestWithApi: (NSString     *)api
        andDictionary: (NSDictionary *)dict
           errorBlock: (ErrorHandle   )errorBlock;

+(void)notificationWithCompletionBlock: (ResponseResult)completionBlock
                            errorBlock: (ErrorHandle   )errorBlock;
+(void)requestWithDictionary: (NSDictionary  *)dict
             completionBlock: (ResponseResult )completionBlock
                  errorBlock: (ErrorHandle    )errorBlock;

@end
