//
//  DMSchedule.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/12/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseGateway.h"

typedef enum
{
    WeekDayIndexMonday = 0,
    WeekDayIndexTuesday,
    WeekDayIndexWednesday,
    WeekDayIndexThursday,
    WeekDayIndexFriday,
    WeekDayIndexSaturday,
    WeekDayIndexSunday
}WeekDayIndex;

@interface DMSchedule : DMBaseGateway

@property (nonatomic, strong) NSString  *scheduleName;
@property (nonatomic, assign) BOOL       isPowerOn;
@property (nonatomic, strong) NSDate    *powerOnTime;
@property (nonatomic, assign) NSInteger  powerOnDuration;
@property (nonatomic, assign) BOOL       isPowerOff;
@property (nonatomic, strong) NSDate    *powerOffTime;
@property (nonatomic, assign) NSInteger  powerOffDuration;
@property (nonatomic, strong) NSArray   *arrRepeatDays;

@end
