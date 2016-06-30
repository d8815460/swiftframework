//
//  DMAccessory.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/10/16.
//  Copyright © 2016 ME. All rights reserved.
//

#import "DMBaseAccessory.h"
#import "DMSchedule.h"


typedef enum
{
    LightEffectCandleLight = 0,
    LightEffectRelaxe,
    LightEffectAlarm,
    LightEffectOcean
}LightEffectType;


@interface DMAccessory : DMBaseAccessory

@property (nonatomic, strong) NSString *location;


///// Light Bulb
//
//// Activity (class?)
//@property (nonatomic, strong) NSDate   *activityTime;
//@property (nonatomic, strong) NSString *activityMessage;
//
//// Effect
//@property (nonatomic, assign) LightEffectType lightEffectType;
//
//// Task
//// IF...THEN...
//
//// Settings
//@property (nonatomic, assign) BOOL isFadingOn;
//@property (nonatomic, assign) BOOL isWakeUpOn;  // ?
//
//// Schedule
//@property (nonatomic, strong) DMSchedule *schedule;
//
//// About
//@property (nonatomic, strong) NSString *udid;
//@property (nonatomic, strong) NSString *type;
//@property (nonatomic, strong) NSString *firmwareVersion;
//
//
///// Wall Switch
//
//
///// Sensor
//

@end
