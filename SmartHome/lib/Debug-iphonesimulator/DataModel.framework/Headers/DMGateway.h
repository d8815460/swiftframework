//
//  DMGateway.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseGateway.h"
#import "DMLocation.h"


#define kUseLocalJsonFile           1


@class DMGateway;


// blocks
typedef void (^DMGatewayResult) (DMGateway *gateway);


@interface DMGateway : DMBaseGateway


#pragma mark - /// class method

+(void)dataWithUID: (NSString      *)uid
   completionBlock: (DMGatewayResult)completionBlock
        errorBlock: (ErrorHandle    )errorBlock;


#pragma mark - /// data source

-(NSInteger)numberOfLocations;
-(NSInteger)numberOfAccessoriesAtSection: (NSInteger)section;

-(DMLocation      *)locationAtSection: (NSUInteger)section;
-(DMBaseAccessory *)accessoryAtIndexPath: (NSIndexPath *)indexPath;


#pragma mark - /// public methods

-(void)addAccessoriesAtIndexPaths: (NSArray *)arrIndexPaths
               toGroupAtIndexPath: (NSIndexPath *)indexPathGroup
                       errorBlock: (ErrorHandle  )errorBlock;
-(void)mergeAccessoriesAtIndexPaths: (NSArray *)arrIndexPaths
                         errorBlock: (ErrorHandle)errorBlock;

@end
