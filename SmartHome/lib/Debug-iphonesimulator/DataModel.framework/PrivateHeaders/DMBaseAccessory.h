//
//  DMBaseAccessory.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/13/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseGateway.h"


typedef enum
{
    StatusNone = -1,
    StatusOn = 0,
    StatusOff,              // 1
    StatusOpenOrTrigger,    // 2
    StatusCloseOrNormal,    // 3
    StatusOffline,          // 4
    StatusCount
}StatusType;

typedef enum
{
    AccessoryNone = -1,
    AccessoryLight = 0,
    AccessoryMotionSensor,      // 1
    AccessoryGarageDoorSensor,  // 2
    AccessoryOpenOrCloseSensor, // 3
    AccessoryWallSwitch,        // 4
    AccessoryGroup,             // 5
    AccessoryCount
}AccessoryType;

typedef enum
{
    TriggerTypeNone = 0,
    TriggerTypeAlarm,
    TriggerTypeCount
}TriggerType;


@interface DMBaseAccessory : DMBaseGateway

@property (nonatomic, assign) StatusType     status;
@property (nonatomic, assign) AccessoryType  type;
@property (nonatomic, assign) TriggerType    trigger;


@end
