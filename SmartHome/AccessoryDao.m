//
//  AccessoryDao.m
//  SmartHome Master
//
//  Created by jakey on 2015/1/16.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "AccessoryDao.h"
#import "Database.h"

@implementation AccessoryDao

+ (void) initDB
{
    [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Accessory(accessory_id INTEGER PRIMARY KEY AUTOINCREMENT, uid TEXT, aid SMALLINT, type SMALLINT)"];
    
}

+ (NSArray*)selectAccessoryWithType:(int)type
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE aid != 0 and type = ?", [NSNumber numberWithShort:type]];
    
    while([rs next]) {
        int accessoryId = [rs intForColumn:@"accessory_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Accessory(%d, %@, %d, %d)", accessoryId, uid, aid, type);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.accessoryId = accessoryId;
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    
    [rs close];
    
    return array;
}

+ (NSArray*)selectAccessoryWithType:(int)type uid:(NSString*)uid
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE aid != 0 and uid = ? and type = ?", uid, [NSNumber numberWithShort:type]];
    
    while([rs next]) {
        int accessoryId = [rs intForColumn:@"accessory_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Accessory(%d, %@, %d, %d)", accessoryId, uid, aid, type);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.accessoryId = accessoryId;
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    
    [rs close];
    
    return array;
}

+ (BOOL)insertWithSmartDev:(Accessory*)accessory
{
    return [[Database sharedDatabase].fmdb executeUpdate:@"INSERT INTO Accessory(uid, aid, type) VALUES(?,?,?)",
            accessory.uid,
            [NSNumber numberWithInt:accessory.aid],
            [NSNumber numberWithInt:accessory.type]];
}

// 刪除所有的accessory所對應的uid
+ (BOOL)deleteAccessoryWithUid:(NSString*)uid
{
    BOOL result = [[Database sharedDatabase].fmdb executeUpdate:@"DELETE FROM Accessory WHERE uid = ?", uid];
    if (result) {
//        GLog(tUI, @"accessoryDELETE成功");
    } else {
//        GLog(tUI, @"accessoryDELETE失敗");
    }
    
    return result;
}

+ (BOOL)deleteWithUid:(NSString*)uid aid:(int)aid
{
    BOOL result = [[Database sharedDatabase].fmdb executeUpdate:@"DELETE FROM Accessory WHERE uid = ? and aid = ?", uid, [NSNumber numberWithShort:aid]];
    if (result) {
//        GLog(tUI, @"accessoryDao_DELETE成功");
    } else {
//        GLog(tUI, @"accessoryDao_DELETE失敗");
    }
    
    return result;
}

+ (NSArray*)getSameAccessoryIdDevices:(int)accessoryId
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
	FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT a1.group_id, a2.uid, a2.aid FROM AccessoryGroup a1, Accessory a2 WHERE a2.accessory_id = ? GROUP BY a1.group_id", [NSNumber numberWithInt:accessoryId]];
    
    while([rs next]) {
//        int groupId = [rs intForColumn:@"group_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        
//        GLog(tUI, @"Load accessoryId in this Group(%d %@ %d)", groupId, uid, aid);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.uid = uid;
        accessory.aid = aid;
    
        [array addObject:accessory];
    }
    
    [rs close];
    
    return array;
}

+ (NSArray*)allDevicesInThisUIDWithoutWifiOrGateway:(NSString*)uid
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE aid != 0 and uid = ?", uid];
    
    while([rs next]) {
        int accessory_id = [rs intForColumn:@"accessory_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Load accessoryId in this Group(%@ %d %d) accessory_id:%dL", uid, aid, type, accessory_id);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.accessoryId = accessory_id;
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    [rs close];
    
    return array;
}

+ (NSArray*)allDevicesInThisUID:(NSString*)uid
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE uid = ?", uid];
    
    while([rs next]) {
        int accessory_id = [rs intForColumn:@"accessory_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Load accessoryId in this Group(%@ %d %d) accessory_id:%dL", uid, aid, type, accessory_id);
        
        Accessory* accessory = [[Accessory alloc] init];
		accessory.accessoryId = accessory_id;
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    [rs close];
    
    return array;
}

+ (NSArray*)getAccessoryArrayWithUID:(NSString*)uid Aid:(int)aid
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE uid = ? and aid = ?", uid, [NSNumber numberWithShort:aid]];
    
    while([rs next]) {
        int accessoryId = [rs intForColumn:@"accessory_id"];
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Load accessoryId in this Group(%@ %d %d)", uid, aid, type);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.accessoryId = accessoryId;
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    [rs close];
    
    return array;
}

+ (NSArray*)selectAll
{
    NSMutableArray *array = [NSMutableArray arrayWithCapacity:5];
    
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory"];
    
    while([rs next]) {
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        
//        GLog(tUI, @"Load accessory_id in this Group(%@ %d %d)", uid, aid, type);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [array addObject:accessory];
    }
    
    [rs close];
    
    return array;
}


+ (Accessory *)getAccessoryWithId:(int)accessoryId
{
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE accessory_id = ?", [NSNumber numberWithInt:accessoryId]];
    if ([rs next]) {
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
//        GLog(tUI, @"Load accessory is (%@ %d %d)", uid, aid, type);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        
        [rs close];
        return accessory;
    }
    
    return nil;
}

+ (Accessory *)getAccessoryWithUID:(NSString *)uid andAid:(int)aid
{
    FMResultSet *rs = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory WHERE uid = ? and aid = ?", uid, [NSNumber numberWithInt:aid]];
    
    if ([rs next]) {
        NSString *uid = [rs stringForColumn:@"uid"];
        int aid = [rs intForColumn:@"aid"];
        int type = [rs intForColumn:@"type"];
        int accessory_id = [rs intForColumn:@"accessory_id"];
//        GLog(tUI, @"Load accessory is (%@ %d %d %d)", uid, aid, type, accessory_id);
        
        Accessory* accessory = [[Accessory alloc] init];
        accessory.uid = uid;
        accessory.aid = aid;
        accessory.type = type;
        accessory.accessoryId = accessory_id;
        [rs close];
        return accessory;
    }
    
    return nil;
}

@end
