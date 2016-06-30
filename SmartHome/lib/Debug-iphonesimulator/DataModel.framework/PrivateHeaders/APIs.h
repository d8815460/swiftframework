//
//  APIs.h
//  SmartHomeDataModel
//
//  Created by Jian on 5/17/16.
//  Copyright © 2016 ME. All rights reserved.
//

#ifndef APIs_h
#define APIs_h

#define kKeyApi         @"api"
#define kKeyUID         @"uid"
#define kKeyIdentity    @"id"
#define kKeyName        @"name"
#define kKeyIndex       @"index"

#define kKeyStatus      @"status"
#define kKeyType        @"type"
#define kKeyTrigger     @"trigger"

#define kKeyLocation    @"location"
//#define kKeyGroup       @"group"
#define kKeyAccessory   @"accessory"

// array
#define kKeyLocations   @"locations"
#define kKeyGroups      @"groups"
#define kKeyAccessories @"accessories"

// add/reassign accessories to group
#define kApiAddAccessoriesToGroup      @"add_accessories_to_group"
#define kApiRemoveAccessoriesFromGroup @"remove_accessories_from_group"

#define kApiMergeAccessories           @"merge_accessories"
// TODO: modify the following macros
#define kApiRemoveAccessory            @"remove_accessory"
#define kApiRemoveGroup                @"remove_group"

#define kApiAddAccessories             @"add_accessories"
#define kApiRemoveAccessories          @"remove_accessories"
#define kApiRemoveGroups               @"remove_groups"

#endif /* APIs_h */
