//
//  Database.m
//  WinG_APP
//
//  Created by jakey_lee on 14/2/18.
//  Copyright (c) 2014年 ChaLin LEE. All rights reserved.
//

// 養成好習慣，import越多，架構的模組化越差
#import "Database.h"
//#import "Utility.h"
//#import "DeviceDao.h"
//#import "LocationDao.h"
//#import "GroupDao.h"
//#import "AccessoryDao.h"
//#import "AccessoryGroupDao.h"
//#import "Device.h"
//#import "DeviceDao.h"
//#import "TutkTPNSFatcory.h"
//#import "SmartDevFactory.h"
//#import "AccessoryDao.h"
//#import "Accessory.h"
//#import "DeviceUtility.h"

#define DATABASE_FILE @"database.sqlite"

#define DEF_DeviceTableVersionNumber			1.0
#define DEF_DeviceTableVersionNumberKeyString	@"DeviceTableVer"

#define DEF_AccessoryTableVersionNumber			1.0
#define DEF_AccessoryTableVersionNumberKeyString	@"AccessoryTableVer"

#define DEF_LocationTableVersionNumber			1.0
#define DEF_LocationTableVersionNumberKeyString	@"LocationTableVer"

#define DEF_GroupsTableVersionNumber			1.0
#define DEF_GroupsTableVersionNumberKeyString	@"GroupsTableVer"

#define DEF_AccessoryGroupTableVersionNumber			1.0
#define DEF_AccessoryGroupTableVersionNumberKeyString	@"AccessoryGroupTableVer"

//#define IS_REBUILD_DB 1

static Database *g_database = nil;

extern NSMutableArray* g_arrIotcDevs;

@implementation Database


// 養成好習慣，利用pragma mark 將method分類清楚
#pragma mark - Database Method

- (void) initDatabase
{
//    GLog( tDatabase, @"+Database - initDatabase" );
#if IS_REBUILD_DB == 1
	
    // 移除資料庫
    [self removeDatabase];
#endif
    
//    BOOL existsDatabase = [self existsDatabase];
    
    [self openDatabase];
    
    // 養成好習慣，降低模組的耦合度
    [self initDB];
    
//    [DeviceDao initDB];
//    [AccessoryDao initDB];
//    [LocationDao initDB];
//    [GroupDao initDB];
//    [AccessoryGroupDao initDB];
}

- (void) openDatabase
{
    // 養成好習慣，不要亂用Utility這類class，會降低模組的耦合度
//    NSString *document = [Utility applicationDocumentsDirectory];
    NSString *document = [self applicationDocumentsDirectory];
//    GLog(tUI, @"document = %@", document);
    
    _fmdb = [[FMDatabase alloc] initWithPath:[NSString stringWithFormat:@"%@/%@", document, DATABASE_FILE]];
    
    if (![_fmdb open]) {
//        GLog(tUI, @"Could not open db.");
        return;
    }
}

- (void) closeDatabase
{
    [_fmdb close];
    _fmdb = nil;
    
//    GLog(tUI, @"close sqlite db ok.");
}

- (void) removeDatabase
{
//	GLog( tDatabase, @"+Database - removeDatabase" );
	
    if (_fmdb) {
        [_fmdb close];
    }
    
    NSString *documentsDirectory = [self applicationDocumentsDirectory];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:DATABASE_FILE];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
    }
}

- (BOOL) existsDatabase
{
    NSString *documentsDirectory = [self applicationDocumentsDirectory];
    NSString *filePath = [documentsDirectory stringByAppendingPathComponent:DATABASE_FILE];
    
    if([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        return YES;
    } else {
        return NO;
    }
}

#pragma mark - Singleton Implementation

+ (Database*)sharedDatabase
{
    if (g_database == nil) {
        g_database = [[super allocWithZone:NULL] init];
    }

    return g_database;
}

#pragma mark - Other Method

#pragma mark - Private Method

// 取得app文件目錄路徑
- (NSString *) applicationDocumentsDirectory
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    return basePath;
}

// 初始化所有table
- (void) initDB
{
//	GLog( tDatabase, @"+Database - initDB" );
	
	BOOL bResult;
	NSUserDefaults* userSettings = [NSUserDefaults standardUserDefaults];
	
	BOOL bResetDatabase = FALSE;
	NSNumber* numVer = [userSettings objectForKey:DEF_DeviceTableVersionNumberKeyString];
	if( [numVer floatValue] != DEF_DeviceTableVersionNumber ) {
		// Due to version diff, delete data table
//		GLog( tDatabase, @"Need to reset Device data table !!!" );
		
		bResetDatabase = TRUE;
	}
	if( [numVer floatValue] != DEF_AccessoryTableVersionNumber ) {
		// Due to version diff, delete data table
//		GLog( tDatabase, @"Need to reset Accessory data table !!!" );
		
		bResetDatabase = TRUE;
	}
	if( [numVer floatValue] != DEF_LocationTableVersionNumber ) {
		// Due to version diff, delete data table
//		GLog( tDatabase, @"Need to reset Location data table !!!" );
		
		bResetDatabase = TRUE;
	}
	if( [numVer floatValue] != DEF_GroupsTableVersionNumber ) {
		// Due to version diff, delete data table
//		GLog( tDatabase, @"Need to reset Groups data table !!!" );
		
		bResetDatabase = TRUE;
	}
	if( [numVer floatValue] != DEF_AccessoryGroupTableVersionNumber ) {
		// Due to version diff, delete data table
//		GLog( tDatabase, @"Need to reset AccessoryGroup data table !!!" );
		
		bResetDatabase = TRUE;
	}
    
    // TODO 暫時全部重設
    bResetDatabase = YES;
	if(bResetDatabase) {
		[self removeDatabase];
		[self openDatabase];
	}

	[userSettings setValue:[NSNumber numberWithFloat:DEF_DeviceTableVersionNumber] forKey:DEF_DeviceTableVersionNumberKeyString];
    bResult = [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Device(device_id INTEGER PRIMARY KEY AUTOINCREMENT, uid TEXT, class_code SMALLINT, product_name TEXT, name TEXT, password TEXT, location_id INTEGER)"];
//	GLog( tDatabase, @"\tDevice DB create %@", bResult?@"<OK>":@"<Failed!>" );
	
#ifdef DEBUG
//	GLog( tUI, @"--------[ Device Table ]----------------------------------------------------------------" );
	FMResultSet *rsDevice = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Device"];
	int nIdxDevice = 0;
	while([rsDevice next]) {
//		NSString* strUID = [rsDevice stringForColumn:@"uid"];
//		unsigned short classcode = [rsDevice intForColumn:@"class_code"];
//		NSString* strProdName = [rsDevice stringForColumn:@"product_name"];
//		NSString* strName = [rsDevice stringForColumn:@"name"];
//		NSString* strPassword = [rsDevice stringForColumn:@"password"];
//		int nLocation = [rsDevice intForColumn:@"location_id"];
		
//		GLog(tUI, @"Device[%d](%@, 0x%04X, %@, %@, ********, %d)", nIdxDevice, strUID, classcode, strProdName, strName, nLocation);
		
		nIdxDevice++;
	}
	[rsDevice close];
#endif
	
	numVer = [userSettings objectForKey:DEF_AccessoryTableVersionNumberKeyString];
	[userSettings setValue:[NSNumber numberWithFloat:DEF_AccessoryTableVersionNumber] forKey:DEF_AccessoryTableVersionNumberKeyString];
	bResult = [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Accessory(accessory_id INTEGER PRIMARY KEY AUTOINCREMENT, uid TEXT, aid SMALLINT, type SMALLINT)"];
//	GLog( tDatabase, @"\tAccessory DB create %@", bResult?@"<OK>":@"<Failed!>" );
	
#ifdef DEBUG
//	GLog( tUI, @"--------[ Accessory Table ]----------------------------------------------------------------" );
	FMResultSet *rsAccessory = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Accessory"];
	int nIdxAccessory = 0;
	while([rsAccessory next]) {
//		int accessory_id = [rsAccessory intForColumn:@"accessory_id"];
//		NSString* strUIDAccessory = [rsAccessory stringForColumn:@"uid"];
//		short aid = [rsAccessory intForColumn:@"aid"];
//		short type = [rsAccessory intForColumn:@"type"];
		
//		GLog(tUI, @"Accessory[%d](%d, %@, AID:%dL, Tyoe:%dL)", nIdxAccessory, accessory_id, strUIDAccessory, aid, type );
		
		nIdxAccessory++;
	}
	[rsAccessory close];
#endif

	numVer = [userSettings objectForKey:DEF_LocationTableVersionNumberKeyString];
	[userSettings setValue:[NSNumber numberWithFloat:DEF_LocationTableVersionNumber] forKey:DEF_LocationTableVersionNumberKeyString];
	bResult = [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Location(location_id INTEGER PRIMARY KEY AUTOINCREMENT, location_name TEXT)"];
//	GLog( tDatabase, @"\tLocation DB create %@", bResult?@"<OK>":@"<Failed!>" );
	
#ifdef DEBUG
//	GLog( tUI, @"--------[ Location Table ]----------------------------------------------------------------" );
	FMResultSet *rsLocation = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Location"];
	int nIdxLocation = 0;
	while([rsLocation next]) {
//		int location_id = [rsLocation intForColumn:@"location_id"];
//		NSString* strLocation = [rsLocation stringForColumn:@"location_name"];
		
//		GLog(tUI, @"Location[%d](%dL, %@)", nIdxLocation, location_id, strLocation );
		
		nIdxLocation++;
	}
	[rsLocation close];
#endif

	numVer = [userSettings objectForKey:DEF_GroupsTableVersionNumberKeyString];
	[userSettings setValue:[NSNumber numberWithFloat:DEF_GroupsTableVersionNumber] forKey:DEF_GroupsTableVersionNumberKeyString];
	bResult = [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS Groups(group_id INTEGER PRIMARY KEY AUTOINCREMENT, group_name TEXT UNIQUE, pic_filepath TEXT)"];
//	GLog( tDatabase, @"\tGroups DB create %@", bResult?@"<OK>":@"<Failed!>" );
	
#ifdef DEBUG
//	GLog( tUI, @"--------[ Groups Table ]----------------------------------------------------------------" );
	FMResultSet *rsGroups = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM Groups"];
	int nIdxGroups = 0;
	while([rsGroups next]) {
//		int group_id = [rsGroups intForColumn:@"group_id"];
//		NSString* strGroupName = [rsGroups stringForColumn:@"group_name"];
//		NSString* strPicPath = [rsGroups stringForColumn:@"pic_filepath"];
		
//		GLog(tUI, @"Groups[%d](%dL, %@, %@)", nIdxGroups, group_id, strGroupName, (strPicPath==nil)?@"(null)":strPicPath );
		
		nIdxGroups++;
	}
	[rsGroups close];
#endif

	numVer = [userSettings objectForKey:DEF_AccessoryGroupTableVersionNumberKeyString];
	[userSettings setValue:[NSNumber numberWithFloat:DEF_AccessoryGroupTableVersionNumber] forKey:DEF_AccessoryGroupTableVersionNumberKeyString];
	bResult = [[Database sharedDatabase].fmdb executeUpdate:@"CREATE TABLE IF NOT EXISTS AccessoryGroup(accessoryGroup_id INTEGER PRIMARY KEY AUTOINCREMENT, accessory_id INTEGER, group_id INTEGER)"];
//	GLog( tDatabase, @"\tAccessoryGroup DB create %@", bResult?@"<OK>":@"<Failed!>" );
	
#ifdef DEBUG
//	GLog( tUI, @"--------[ AccessoryGroup Table ]----------------------------------------------------------------" );
	FMResultSet *rsAccessoryGroup = [[Database sharedDatabase].fmdb executeQuery:@"SELECT * FROM AccessoryGroup"];
	int nIdxAccessoryGroup = 0;
	while([rsAccessoryGroup next]) {
//		int accessoryGroup_id = [rsLocation intForColumn:@"accessoryGroup_id"];
//		int accessory_id2 = [rsLocation intForColumn:@"accessory_id"];
//		int group_id2 = [rsLocation intForColumn:@"group_id"];
		
//		GLog(tUI, @"Groups[%d](%dL, accessory_id:%d, group_id:%d)", nIdxAccessoryGroup, accessoryGroup_id, accessory_id2, group_id2 );
		
		nIdxAccessoryGroup++;
	}
	[rsAccessoryGroup close];
#endif
}

@end
