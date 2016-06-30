//
//  DMGateway.m
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

@import UIKit;

#import "DMGateway.h"


@interface DMGateway ()

@property (nonatomic, strong) NSMutableArray *arrLocations;

@end


@implementation DMGateway


-(instancetype)initWithDictionary: (NSDictionary *)dict
{
    if (dict == nil)
    {
        return nil;
    }
    
    self = [super initWithDictionary: dict];
    
    [self updateWithDictionary: dict];
         
    return self;
}

-(void)updateWithDictionary:(NSDictionary *)dict
{
    if (dict == nil)
    {
        return;
    }
    
    [super updateWithDictionary: dict];
    
    NSMutableArray *arrObjects = [[NSMutableArray alloc] init];
    
    // locations
    NSArray *arrLocations = dict[kKeyLocations];
    for (NSDictionary *dict in arrLocations)
    {
        DMLocation *location = [[DMLocation alloc] initWithDictionary: dict];
        [arrObjects addObject: location];
    }
    
    self.arrLocations = arrObjects;
}


#pragma mark - /// getter

-(NSString *)keyJsonArray
{
    return kKeyLocations;
}


#pragma mark - /// public methods

+(void)dataWithUID: (NSString      *)uid
   completionBlock: (DMGatewayResult)completionBlock
        errorBlock: (ErrorHandle    )errorBlock
{
    if (uid.length == 0)
    {
        NSError *error = [super errorWithCode: -1
                               andDescription: @"Invalid UID lenght"];
        
        errorBlock(error);
        
        return;
    }
    
#if kUseLocalJsonFile
    // delay time in seconds
    CGFloat second = 0.5;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(second * NSEC_PER_SEC)),
                   dispatch_get_main_queue(), ^{
                       
                       NSString     *jsonFile = @"gateway";
                       NSDictionary *json     = [super loadJsonFromFile: jsonFile];
                       
                       NSInteger errorCode = [json[@"error"] integerValue];
                       if (errorCode)
                       {
                           // error
                           NSError *error = [super errorWithCode: errorCode
                                                  andDescription: @"Error occurred"];
                           
                           errorBlock(error);
                       }
                       else
                       {
                           // success
                           NSDictionary *responses = json[@"response"];
                           
                           DMGateway *gateway = [[DMGateway alloc] initWithDictionary: responses];
                           
                           completionBlock(gateway);
                       }
                   });
#else
    // TODO: send request with uid
    NSDictionary *json = @{@"uid": uid};
    
    [DMBaseGateway requestWithDictionary: json
                         completionBlock: ^(NSDictionary *response) {
                             
                             DMGateway *gateway = [[DMGateway alloc] initWithDictionary: response];
                             
                             completionBlock(gateway);
                         }
                              errorBlock: ^(NSError *error) {
                                  
                                  errorBlock(error);
                              }];
#endif
}

-(void)addAccessoriesAtIndexPaths:(NSArray *)arrIndexPaths
               toGroupAtIndexPath:(NSIndexPath *)indexPathGroup
                       errorBlock:(ErrorHandle)errorBlock
{
    NSArray         *arrAccessories = [self accessoriesFromIndexPaths: arrIndexPaths];
    DMBaseAccessory *group          = [self accessoryAtIndexPath: indexPathGroup];
    
    [self addAccessories: arrAccessories
                 toGroup: group
              errorBlock: ^(NSError *error) {
                  
                  errorBlock(error);
              }];
}

-(void)mergeAccessoriesAtIndexPaths: (NSArray *)arrIndexPaths
                         errorBlock: (ErrorHandle)errorBlock
{
    NSArray *arrAccessories = [self accessoriesFromIndexPaths: arrIndexPaths];
    
    [self mergeAccessories: arrAccessories
                errorBlock: ^(NSError *error) {
                    
                    errorBlock(error);
                }];
}


#pragma mark - /// request

-(void)     api: (NSString *)api
    accessories: (NSArray *)arrAccessories
     errorBlock: (ErrorHandle)errorBlock
{
    NSError *error = [self validateAccessories: arrAccessories];
    if (error)
    {
        errorBlock(error);
        
        return;
    }
    
    AccessoryType type = [self typeFromAccessories: arrAccessories];
    
    if (type == AccessoryNone)
    {
        NSError *error = [DMBase errorWithCode: -1
                                andDescription: @"Accessory array contains AccessoryNone type."];
        
        errorBlock(error);
        
        return;
    }
    
    NSArray *jsonObjects = [self jsonArrayFromObjects: arrAccessories];
    
    [self requestWithApi: api
           andDictionary: @{kKeyAccessories: jsonObjects}
              errorBlock: ^(NSError *error) {
                  
                  errorBlock(error);
              }];
}

-(void)     api: (NSString *)api
    accessories: (NSArray *)arrAccessories
          group: (DMBaseAccessory *)group
     errorBlock: (ErrorHandle      )errorBlock
{
    NSError *error = [self validateAccessories: arrAccessories
                                      andGroup: group];
    
    if (error)
    {
        errorBlock(error);
        
        return;
    }
    
    NSDictionary *jsonGroup = [group jsonWithArray: arrAccessories];
    
    [self requestWithApi: api
           andDictionary: jsonGroup
              errorBlock: ^(NSError *error) {
                  
                  errorBlock(error);
              }];
}


#pragma mark - /// request helper

-(void)addAccessories: (NSArray *)arrAccessories
           errorBlock: (ErrorHandle)errorBlock
{
    [self       api: kApiAddAccessories
        accessories: arrAccessories
         errorBlock: ^(NSError *error) {
               
               errorBlock(error);
           }];
}

-(void)addAccessories: (NSArray         *)arrAccessories
              toGroup: (DMBaseAccessory *)group
           errorBlock: (ErrorHandle      )errorBlock
{
    [self       api: kApiAddAccessoriesToGroup
        accessories: arrAccessories
              group: group
         errorBlock: ^(NSError *error) {
             
             errorBlock(error);
         }];
}

-(void)mergeAccessories: (NSArray *)arrAccessories
             errorBlock: (ErrorHandle)errorBlock
{
    [self       api: kApiMergeAccessories
        accessories: arrAccessories
         errorBlock: ^(NSError *error) {
               
               errorBlock(error);
           }];
}

-(void)removeGroups: (NSArray *)arrAccessories
         errorBlock: (ErrorHandle)errorBlock
{
    [self       api: kApiRemoveGroups
        accessories: arrAccessories
         errorBlock: ^(NSError *error) {
               
               errorBlock(error);
           }];
}

-(void)removeAccessories: (NSArray *)arrAccessories
              errorBlock: (ErrorHandle)errorBlock
{
    [self       api: kApiRemoveAccessories
        accessories: arrAccessories
         errorBlock: ^(NSError *error) {
               
               errorBlock(error);
           }];
}

-(void)removeAccessories: (NSArray *)arrAccessories
               fromGroup: (DMBaseAccessory *)group
              errorBlock: (ErrorHandle      )errorBlock
{
    [self       api: kApiRemoveAccessoriesFromGroup
        accessories: arrAccessories
              group: group
         errorBlock: ^(NSError *error) {
             
             errorBlock(error);
         }];
}


#pragma mark - /// data source

-(NSInteger)numberOfLocations
{
    return self.arrLocations.count;
}

-(NSInteger)numberOfAccessoriesAtSection: (NSInteger)section
{
    if (section >= self.arrLocations.count)
    {
        return 0;
    }
    
    DMLocation *location = self.arrLocations[section];
    
    return location.arrAccessories.count;
}

-(DMLocation *)locationAtSection:(NSUInteger)section
{
    if (section >= self.arrLocations.count)
    {
        return nil;
    }
    
    DMLocation *location = self.arrLocations[section];
    
    return location;
}

-(DMBaseAccessory *)accessoryAtIndexPath:(NSIndexPath *)indexPath
{
    DMLocation      *location  = [self     locationAtSection: indexPath.section];
    DMBaseAccessory *accessory = [location accessoryAtIndex : indexPath.row];
    
    return accessory;
}


#pragma mark - /// helper

// TODO: remove the following method
-(void)insertAccessory: (DMBaseAccessory *)accessory
           atIndexPath: (NSIndexPath     *)indexPath
{
    DMLocation *location = [self locationAtSection: indexPath.section];
    
    [location.arrAccessories insertObject: accessory
                                  atIndex: indexPath.row];
}

// TODO: remove the following method
-(DMBaseAccessory *)removeAccessoryAtIndexPath: (NSIndexPath *)indexPath
{
    // remove accessory from location
    DMBaseAccessory *accessory = [self accessoryAtIndexPath: indexPath];
    DMLocation      *location  = [self locationAtSection: indexPath.section];
    
    [location.arrAccessories removeObject: accessory];
    
    return accessory;
}

// only for non-group accessories
-(NSArray *)accessoriesFromIndexPaths: (NSArray *)arrIndexPaths
{
    NSMutableArray *arrAccessories = [[NSMutableArray alloc] init];
    
    for (NSIndexPath *indexPath in arrIndexPaths)
    {
        DMBaseAccessory *accessory = [self accessoryAtIndexPath: indexPath];
        
        if (accessory.type == AccessoryGroup)
        {
            return nil;
        }
        
        [arrAccessories addObject: accessory];
    }
    
    return arrAccessories;
}

-(AccessoryType)typeFromAccessories: (NSArray *)arrAccessories
{
    DMBaseAccessory *accessoryFirst = [arrAccessories firstObject];
    AccessoryType type = accessoryFirst.type;
    
    for (DMBaseAccessory *accessory in arrAccessories)
    {
        if (accessory.type != type)
        {
            return AccessoryNone;
        }
    }
    
    return type;
}

-(NSError *)validateAccessories: (NSArray *)arrAccessories
{
    if (arrAccessories       == nil ||
        arrAccessories.count == 0     )
    {
        NSError *error = [DMBase errorWithCode: -1
                                andDescription: @"Number of accessories is 0."];
        
        return error;
    }
    
    AccessoryType type = [self typeFromAccessories: arrAccessories];
    
    if (type == AccessoryNone)
    {
        NSError *error = [DMBase errorWithCode: -1
                                andDescription: @"Accessory array contains different accessory types."];
        
        return error;
    }
    
    return nil;
}

-(NSError *)validateAccessories: (NSArray *)arrAccessories
                       andGroup: (DMBaseAccessory *)group
{
    NSError *error = [self validateAccessories: arrAccessories];
    if (error)
    {
        return error;
    }
    
    if (group == nil || group.type != AccessoryGroup)
    {
        NSError *error = [DMBase errorWithCode: -1
                                andDescription: @"Group is not an AccessoryGroup type."];
        
        return error;
    }
    
    return nil;
}


@end
