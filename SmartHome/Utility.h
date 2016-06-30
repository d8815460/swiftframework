//
//  Utility.h
//  SmartHome Master
//
//  Created by jakey on 2014/12/12.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>
//#import <SmartDevice/SmartDevBase.h>
//#import "FunctionStatus.h"
//#import <SmartDevice/AccessoryTypeEnum.h>
//#import "CreateGroup.h"
#import "SmartDeviceModel.h"

typedef void (^StoryboardViewControllerBlock) (UIViewController *viewController);

@interface Utility : NSObject <UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>

// group 裡面的所有的device array
+ (NSMutableArray *)groupTransferCodeArray:(NSMutableArray *)groupModels;


//+ (NSString *) applicationDocumentsDirectory;
//
//+ (NSString*)SSID;

+ (UIViewController*) storyboardViewController:(UINavigationController*)navigationController storyboardName:(NSString*)storyboardName viewController:(NSString*)viewControllerName;

+ (void) storyboardPushViewController:(UINavigationController*)navigationController storyboardName:(NSString*)storyboardName viewController:(NSString*)viewControllerName;

+ (void) storyboardPushViewController:(UINavigationController*)navigationController storyboardName:(NSString*)storyboardName viewController:(NSString*)viewControllerName viewControllerCallback:(StoryboardViewControllerBlock)viewControllerCallback;
//
//+ (void) storyboardPushViewController:(UINavigationController*)navigationController storyboardName:(NSString*)storyboardName viewController:(NSString*)viewControllerName accessoryType:(enum AccessoryType)accessoryType;
//
//+ (UITableViewCell*) tableViewCellWithSubView:(UIView*)view;
//
//+ (void) openSetting;
//
//// 取得TransferCode轉換數值
//+ (double)numberOfTransferCodeArray:(unsigned short[])pTransferCodeArray;

// 舊版functionCode轉FunctionStatus
//+ (FunctionStatus*)functioncodeToFunctionStatus:(unsigned int) functionCode transferCodeLength:(int) transferCodeLength pTransferCodeArray:(unsigned short*) pTransferCodeArray;

// functionStatus 轉 DeviceName
//+ (NSString *)functionStatusToDeviceName:(NSMutableArray *)transferCodeArrayList;

// DeviceName 轉 FunctionStatus
//+ (NSArray *)DeviceNameToFunctionStatus:(NSString *)deviceName withFunctionCode:(int)functionCode;

//// 新增照片儲存至雲端
//+ (void) savePhotoToParse:(UIImage *)originImage forUID:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 新增設備名稱儲存至雲端
//+ (void) saveDeviceNameToParse:(NSString *)deviceName forUID:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 讀取設備上的名稱，儲存至雲端
//+ (void) getCommand24DeviceName:(NSString *)deviceName forUID:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 設備是否有攝影機
//+ (BOOL) shouldStartCameraController:(CameraUI *)camera fromViewController:(UIViewController *)viewController;
//
//// 是否有相簿
//+ (BOOL) shouldStartPhotoLibraryPickerController:(CameraUI *)camera fromViewController:(UIViewController *)viewController;
//
//// 讀取雲端設備照片
//+ (void) getDevicePhotoCachedThenNetwork:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
//
//// 讀取雲端設備照片，依accessoryType
//+ (void) getDevicePhotoCachedThenNetwork:(NSString *)deviceUID andAID:(int)aid byAccessoryType:(int)type block:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
//+ (void) displayDefaultPictureFromType:(int)type block:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
//
//// 判斷Cell的總類，回應高度
//+ (CGFloat)getCellHightFromAccessoryType:(int)accessoryType;
//
//// 使用class code取得
//+ (enum AccessoryType) getAccessoryTypeWithClassCode:(unsigned short)classCode;
//
//// 轉至指定的型態清單頁面
//+ (void) gotoAccessoryTypeListWithType:(enum AccessoryType)deviceType navigationController:(UINavigationController*)navigationController goToNavigationControlerArray:(NSArray*)goToNavigationControlerArray smartDevBase:(SmartDevBase*)smartDevBase;
//
//// 新增Group
//+ (void) saveGroup:(CreateGroup *)group block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 編輯Group
//+ (void) editGroup:(PFObject *)group groupName:(NSString *)groupNmae deviceArray:(NSArray *)deviceArray GroupImage:(UIImage *)groupImage isChangePhoto:(BOOL)isChangePhoto block:(void (^)(BOOL succeeded, PFObject *group))completionBlock;
//
//// 取回某個用戶的Group清單
//+ (void) getUsersGroupsCacheThenNetwork:(PFUser *)currentUser block:(void (^)(BOOL succeeded, NSArray *groups))completionBlock;
//
//// 取回雲端Group的照片
//+ (void) getGroupPhotoCachedThenNetwork:(PFObject *)group block:(void (^)(BOOL succeeded, UIImage *image))completionBlock;
//
////根據AccessoryType取回種類名稱
//+ (NSString *) getKindNameWithAccessoryType:(int)type;
//
//
// 刪除devie同步至Group
//+ (void) deleteDeviceWithAccessory_ID:(int)accessory_id WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 刪除gateway Device 同步Group
//+ (void) deleteDeviceWithAccessory_ID:(int)accessory_id withSensors:(NSArray *)sensors WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock;
//
//// 刪除devies同步至Group
//+ (void) deleteDeviceWithAccessoryIDArray:(NSArray *)accessoryIdArray WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock;

@end
