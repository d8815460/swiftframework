//
//  Utility.m
//  SmartHome Master
//
//  Created by jakey on 2014/12/12.
//  Copyright (c) 2014年 TUTK. All rights reserved.
//

#import "Utility.h"
//#import "LANSearchDevice.h"
//#import <IOTCamera/AVIOCTRLDEFs.h>
//#import "SSIDInfo.h"
//#import "DeviceUtility.h"
//#import "AccessoryListViewController.h"
//#import "CommandUtility.h"
//#import <SmartDevice/AccessoryTypeEnum.h>
//#import <MobileCoreServices/UTCoreTypes.h>
//#import "CameraUI.h"
//#import "UIImage+ResizeAdditions.h"
//#import "AICache.h"
//#import "StoryboardUtility.h"
//#import "AddSensorViewController.h"
//#import "AIConstants.h"
//#import "Accessory.h"
//#import "MyFile.h"
//#import <FCFileManager.h>
#import <Parse/Parse.h>

@implementation Utility

// group 裡面的所有的device array
+ (NSMutableArray *)groupTransferCodeArray:(NSMutableArray *)groupModels {
    NSMutableArray *array = [[NSMutableArray alloc] init];
    for (int i = 0; i < groupModels.count; i++) {
        [array addObject:[NSNumber numberWithInt:[(SmartDeviceModel *)groupModels[i] aid]]];
        [array addObject:[NSNumber numberWithInt:[(SmartDeviceModel *)groupModels[i] type]]];
    }
    return array;
}


//+ (NSString*)SSID
//{
//    NSDictionary *ifs = [SSIDInfo fetchSSIDInfo];
////    GLog(tUI, @"ifs:%@", ifs);
//    
//    NSString *ssid = [[ifs objectForKey:@"SSID"] copy];
//    GLog(tUI, @"ssid:%@", ssid);
//    
//    return ssid;
//}
//
//// 取得app文件目錄路徑
//+ (NSString *) applicationDocumentsDirectory
//{
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *basePath = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
//    return basePath;
//}

//+ (NSArray*)lanSearchUIDList
//{
//    int num = 0;
//    int cnt = 0;
//    
//    NSMutableArray *array = [[[NSMutableArray alloc] initWithCapacity:5] autorelease];
//    while (num == 0 && cnt++ < 2) {
//        LanSearch_t *pLanSearchAll = [Camera LanSearch:&num timeout:2000];
//        GLog(tUI, @"camera found(%d)\n", num);
//        
//        if (num > 0) {
//            for (int i=0 ; i<num ; i++) {
//                NSString *uid = [[[NSString alloc] initWithCString:pLanSearchAll[i].UID encoding:NSUTF8StringEncoding] autorelease];
//                //        NSString *uid = [NSString stringWithFormat:@"%s", pLanSearchAll[0].UID];
//                GLog(tUI, @"uid[%d]:%@", i, uid);
//                [array addObject:uid];
//            }
//        }
//        
//        if(pLanSearchAll) {
//            free(pLanSearchAll);
//        }
//        
//        if ([array count] > 0) {
//            break;
//        }
//    }
//    
//    return array;
//}
//
//+ (UITableViewCell*) tableViewCellWithSubView:(UIView*)view
//{
//    UIView *sView = [view superview];
//    while (sView != nil && ![sView isKindOfClass:[UITableViewCell class]]) {
//        sView = [sView superview];
//    }
//    
//    return (UITableViewCell*) sView;
//}

+ (UIViewController*) storyboardViewController:(UINavigationController*)navigationController
                                storyboardName:(NSString*)storyboardName
                                viewController:(NSString*)viewControllerName
{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    return [storyboard instantiateViewControllerWithIdentifier:viewControllerName];
}

+ (void) storyboardPushViewController:(UINavigationController*)navigationController
                       storyboardName:(NSString*)storyboardName
                       viewController:(NSString*)viewControllerName
{
    UIViewController *viewController = [Utility storyboardViewController:navigationController storyboardName:storyboardName viewController:viewControllerName];
    [navigationController pushViewController:viewController animated:YES];
}

+ (void) storyboardPushViewController:(UINavigationController*)navigationController
                       storyboardName:(NSString*)storyboardName
                       viewController:(NSString*)viewControllerName
               viewControllerCallback:(StoryboardViewControllerBlock)viewControllerCallback
{
    UIViewController *viewController = [Utility storyboardViewController:navigationController storyboardName:storyboardName viewController:viewControllerName];
    
    // callback viewController
    viewControllerCallback(viewController);
    
    [navigationController pushViewController:viewController animated:YES];
}

//+ (void) storyboardPushViewController:(UINavigationController*)navigationController
//                       storyboardName:(NSString*)storyboardName
//                       viewController:(NSString*)viewControllerName
//                        accessoryType:(enum AccessoryType)accessoryType
//{
//    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
//    AccessoryListViewController *accessoryListViewController = (AccessoryListViewController*) [storyboard instantiateViewControllerWithIdentifier:viewControllerName];
//    accessoryListViewController.accessoryType = accessoryType;
//    [navigationController pushViewController:accessoryListViewController animated:YES];
//}


//+ (void) openSetting
//{
//    NSString *url = UIApplicationOpenSettingsURLString;
//    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:url]]) {
//        [[UIApplication sharedApplication] openURL:[NSURL URLWithString:url]];
//    }
//}
//
//+ (double)numberOfTransferCodeArray:(unsigned short[])pTransferCodeArray
//{
//    double value = pTransferCodeArray[0];
//    
//    //            unsigned short smallNumber = pTransferCodeArray[1];
//    //            NSString* string = [NSString stringWithFormat:@"%d", smallNumber];
//    value += pTransferCodeArray[1] / 10000.0;
//    
//    return value;
//}

// 舊版functionCode轉FunctionStatus
//+ (FunctionStatus*)functioncodeToFunctionStatus:(unsigned int)functionCode transferCodeLength:(int)transferCodeLength pTransferCodeArray:(unsigned short*)pTransferCodeArray
//{
//    FunctionStatus *functionStatus = [[FunctionStatus alloc] init];
//    functionStatus.functionCode = functionCode;
//    functionStatus.transferCodeArrayList = [NSMutableArray arrayWithCapacity:5];
//    
//    for (int i=0 ; i<transferCodeLength ; i++) {
//        int transferCode = pTransferCodeArray[i];
//        
//        [functionStatus.transferCodeArrayList addObject:[NSNumber numberWithInt:transferCode]];
//    }
//    
//    return functionStatus;
//}

// 查詢Device的名稱，透過functionStatus取回DeviceName
//+ (NSString *)functionStatusToDeviceName:(NSMutableArray *)transferCodeArrayList
//{
//    NSMutableString* totalString = [NSMutableString stringWithCapacity:transferCodeArrayList.count];
//    for (int i=0 ; i<transferCodeArrayList.count ; i++) {
//        int transferCode = [[transferCodeArrayList objectAtIndex:i] intValue];
////        GLog(tUI, @"functionCode:%d", transferCode);
//        NSString *string = [NSString stringWithFormat:@"%C", (const unichar) transferCode];
//        [totalString appendString:string];
////        GLog(tUI, @"string:%@", string);
//    }
//    GLog(tUI, @"totalString:%@", totalString);
//    
//    // 智能設備名稱
//    return totalString;
//}

// DeviceName 轉 FunctionStatus
//+ (NSArray *)DeviceNameToFunctionStatus:(NSString *)deviceName withFunctionCode:(int)functionCode
//{
//    FunctionStatus *deviceFunctionStatus = [[FunctionStatus alloc] init];
//    deviceFunctionStatus.functionCode = functionCode;
//    NSMutableArray *deviceNameArray = [[NSMutableArray alloc] init];
//    
//    for (int i = 0; i < deviceName.length; i++) {
//        [deviceNameArray addObject:[NSString stringWithFormat:@"%hu",[deviceName characterAtIndex:i]]];
//    }
//    
//    deviceFunctionStatus.transferCodeArrayList = deviceNameArray;
//
//    NSArray *sendFunctionCodeArray = [NSArray arrayWithObjects:deviceFunctionStatus, nil];
//    
//    return sendFunctionCodeArray;
//}

//// 新增照片
//+ (void) savePhotoToParse:(UIImage *)originImage forUID:(NSString *)deviceUID andAID:(int)gatewayAID block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
//    UIImage *mediumImage = [originImage thumbnailImage:640 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationHigh];
//    UIImage *smallImage = [originImage thumbnailImage:100 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationLow];
//    
//    NSData *mediumImageData = UIImagePNGRepresentation(mediumImage);
//    NSData *smallImageData = UIImagePNGRepresentation(smallImage);
//    
//    //存Cache
//    [[AICache sharedCache] setPhotoToUID:deviceUID andAID:gatewayAID deviceImage:[UIImage imageWithData:mediumImageData]];
//    
//    PFACL *ACL = [PFACL ACL];
//    [ACL setPublicReadAccess:YES];
//    [ACL setPublicWriteAccess:YES];
//    
//#if DEF_isLanNetWork == 1
//    //本機端只要確認是否有本地的照片檔案
//    //创建文件管理器
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    NSString *imageFilePath = [NSString stringWithFormat:@"%@%i.png", deviceUID, gatewayAID];// pictures stored in the local Documents
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    //获取文件路径
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//    //不管存在不存在都需要儲存
//    [fileManager createFileAtPath:path contents:mediumImageData attributes:nil];
//    completionBlock(TRUE,nil);
//#else
//    //確認Parse是不是已經儲存這個UID及AID的照片，如果沒有就要新增，只有Internet模式才需要確認，本地端不用
//    PFQuery *isExistPhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//    [isExistPhoto whereKey:@"UID" equalTo:deviceUID];
//    [isExistPhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:gatewayAID]];
//    GLog(tUI, @"gatewayAID = %d", gatewayAID);
//    [isExistPhoto getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject, NSError *error){
//        if (error) {
//            //新增
//            PFObject *saveObject = [PFObject objectWithClassName:@"devicePhoto"];
//            
//            [saveObject setObject:[PFUser currentUser] forKey:@"userID"];
//            [saveObject setObject:deviceUID forKey:@"UID"];
//            [saveObject setObject:[NSNumber numberWithInt:gatewayAID] forKey:@"AID"];
//            
//            PFFile *fileMediumImage = [PFFile fileWithData:mediumImageData];
//            PFFile *fileSmallRoundedImage = [PFFile fileWithData:smallImageData];
//            
//            [saveObject setObject:fileMediumImage forKey:@"picMedium"];
//            [saveObject setObject:fileSmallRoundedImage forKey:@"picSmall"];
//            
//            saveObject.ACL = ACL;
//            //儲存到雲端
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//            
//        }else{
//            //覆蓋
//            PFFile *fileMediumImage = [PFFile fileWithData:mediumImageData];
//            PFFile *fileSmallRoundedImage = [PFFile fileWithData:smallImageData];
//            
//            [saveObject setObject:fileMediumImage forKey:@"picMedium"];
//            [saveObject setObject:fileSmallRoundedImage forKey:@"picSmall"];
//            
//            saveObject.ACL = ACL;
//            
//            //儲存到雲端
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//        }
//    }];
//#endif
//}
//
//+ (void) saveObject:(PFObject *)saveObject ACL:(PFACL *)ACL mediumData:(NSData *)mediumImageData smallRoundedImageData:(NSData *)smallRoundedImageData toDeviceUID:(NSString *)deviceUID block:(void (^)(BOOL succeeded, NSError *error))completionBlock{
//    
//}
//
//+ (BOOL) shouldStartCameraController:(CameraUI *)camera fromViewController:(UIViewController *)viewController
//{
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera] == NO) {
//        return NO;
//    }
//    
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]
//        && [[UIImagePickerController availableMediaTypesForSourceType:
//             UIImagePickerControllerSourceTypeCamera] containsObject:(NSString *)kUTTypeImage]) {
//        
//        camera.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
//        camera.sourceType = UIImagePickerControllerSourceTypeCamera;
//        
//        if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceRear]) {
//            camera.cameraDevice = UIImagePickerControllerCameraDeviceRear;
//        } else if ([UIImagePickerController isCameraDeviceAvailable:UIImagePickerControllerCameraDeviceFront]) {
//            camera.cameraDevice = UIImagePickerControllerCameraDeviceFront;
//        }
//    } else {
//        return NO;
//    }
//    camera.allowsEditing = YES;
//    camera.showsCameraControls = YES;
//    
//    [viewController presentViewController:camera animated:YES completion:nil];
//    return YES;
//}
//
//+ (BOOL) shouldStartPhotoLibraryPickerController:(CameraUI *)camera fromViewController:(UIViewController *)viewController
//{
//    if (([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary] == NO
//         && [UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum] == NO)) {
//        return NO;
//    }
//    
//    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]
//        && [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypePhotoLibrary] containsObject:(NSString *)kUTTypeImage]) {
//        camera.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
//        camera.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
//        
//    } else if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeSavedPhotosAlbum]
//               && [[UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeSavedPhotosAlbum] containsObject:(NSString *)kUTTypeImage]) {
//        camera.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
//        camera.mediaTypes = [NSArray arrayWithObject:(NSString *) kUTTypeImage];
//    } else {
//        return NO;
//    }
//    camera.allowsEditing = YES;
//    
//    [viewController presentViewController:camera animated:YES completion:nil];
//    return YES;
//}
//
//// 新增設備名稱儲存至雲端
//+ (void) saveDeviceNameToParse:(NSString *)deviceName forUID:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
//    //存Cache
//    [[AICache sharedCache] setNameToUID:deviceUID andAID:aid deviceName:deviceName];
//    
//    PFACL *ACL = [PFACL ACL];
//    [ACL setPublicReadAccess:YES];
//    [ACL setPublicWriteAccess:YES];
//    
//    //確認Parse是不是已經儲存這個UID及AID的照片，如果沒有就要新增
//    PFQuery *isExistPhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//    [isExistPhoto whereKey:@"UID" equalTo:deviceUID];
//    [isExistPhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//    GLog(tUI, @"gatewayAID = %d", aid);
//#if defined(DEF_isLanNetWork)
//    [isExistPhoto fromLocalDatastore];
//#else
//    
//#endif
//    [isExistPhoto getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject, NSError *error){
//        if (error) {
//            //新增
//            PFObject *saveObject = [PFObject objectWithClassName:@"devicePhoto"];
//            
//            [saveObject setObject:[PFUser currentUser] forKey:@"userID"];
//            [saveObject setObject:deviceUID forKey:@"UID"];
//            [saveObject setObject:[NSNumber numberWithInt:aid] forKey:@"AID"];
//            [saveObject setObject:deviceName forKey:@"name"];
//            
//            saveObject.ACL = ACL;
//            
//#if defined(DEF_isLanNetWork)
//            [saveObject pinInBackground];
//            completionBlock(TRUE,nil);
//#else
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//#endif
//            
//            
//        }else{
//            //覆蓋
////            [saveObject setObject:[PFUser currentUser] forKey:@"userID"];
////            [saveObject setObject:deviceUID forKey:@"UID"];
////            [saveObject setObject:[NSNumber numberWithInt:aid] forKey:@"AID"];
//            [saveObject setObject:deviceName forKey:@"name"];
//            
//            saveObject.ACL = ACL;
//            
//#if defined(DEF_isLanNetWork)
//            [saveObject pinInBackground];
//            completionBlock(TRUE,nil);
//#else
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//#endif
//            
//        }
//    }];
//}
//
//// 讀取設備上的名稱，儲存至雲端
//+ (void) getCommand24DeviceName:(NSString *)deviceName forUID:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
//    //存Cache
//    [[AICache sharedCache] setNameToUID:deviceUID andAID:aid deviceName:deviceName];
//    
//    PFACL *ACL = [PFACL ACL];
//    [ACL setPublicReadAccess:YES];
//    [ACL setPublicWriteAccess:YES];
//    
//    //確認Parse是不是已經儲存這個UID及AID的照片，如果沒有就要新增
//    PFQuery *isExistPhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//    [isExistPhoto whereKey:@"UID" equalTo:deviceUID];
//    [isExistPhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//    GLog(tUI, @"gatewayAID = %d", aid);
//    [isExistPhoto getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject, NSError *error){
//        if (error) {
//            //新增
//            PFObject *saveObject = [PFObject objectWithClassName:@"devicePhoto"];
//            
//            [saveObject setObject:[PFUser currentUser] forKey:@"userID"];
//            [saveObject setObject:deviceUID forKey:@"UID"];
//            [saveObject setObject:[NSNumber numberWithInt:aid] forKey:@"AID"];
//            [saveObject setObject:deviceName forKey:@"name"];
//            
//            saveObject.ACL = ACL;
//            
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//        }else{
//            //覆蓋
//            [saveObject setObject:deviceName forKey:@"name"];
//            
//            saveObject.ACL = ACL;
//            
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    completionBlock(succeeded,nil);
//                    
//                }else{
//                    GLog(tUI, @"上傳失敗");
//                    completionBlock(FALSE, error);
//                }
//            }];
//        }
//    }];
//}
//
//
//// 讀取雲端設備照片
//+ (void) getDevicePhotoCachedThenNetwork:(NSString *)deviceUID andAID:(int)aid block:(void (^)(BOOL succeeded, UIImage *image))completionBlock
//{
//#if defined(DEF_isLanNetWork)
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    NSString *imageFilePath = [NSString stringWithFormat:@"%@%i.png", deviceUID, aid];// pictures stored in the local Documents
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    //获取文件路径
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//    if ([fileManager fileExistsAtPath:path]) {
//        NSData *mediumimageData = [NSData dataWithContentsOfFile:path];
//        //有設備的照片檔案
//        completionBlock (TRUE, [UIImage imageWithData:mediumimageData]);
//    }else{
//        completionBlock (FALSE, nil);
//    }
//#else
//    //讀取雲端的照片
//    if ([[AICache sharedCache] hasPhotoByUID:deviceUID andAID:aid]) {
//        //有Cache就先讀
//        completionBlock(true, [[AICache sharedCache] imageForUID:deviceUID andAID:aid]);
//        
//        //接著背景下載照片
//        PFQuery *queryDevicePhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//        [queryDevicePhoto whereKey:@"UID" equalTo:deviceUID];
//        [queryDevicePhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//        [queryDevicePhoto getFirstObjectInBackgroundWithBlock:^(PFObject *photo, NSError *error){
//            if (!error) {
//                //如果雲端上沒有資料就不處理
//                PFFile *photoFile = [photo objectForKey:@"picMedium"];
//                [photoFile getDataInBackgroundWithBlock:^(NSData *photoData, NSError *error){
//                    if (!error) {
//                        //存Cache
//                        [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceImage:[UIImage imageWithData:photoData] deviceName:[photo objectForKey:@"name"]];
//                    }else{
//                        
//                    }
//                }];
//                
//                if ([photo objectForKey:@"name"]) {
//                    //存Cache
//                    [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceName:[photo objectForKey:@"name"]];
//                }
//            }else{
//                
//            }
//        }];
//        
//    }else{
//        
//        PFQuery *queryDevicePhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//        [queryDevicePhoto whereKey:@"UID" equalTo:deviceUID];
//        [queryDevicePhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//        
//        GLog(tUI, @"deviceUID:%@", deviceUID);
//        GLog(tUI, @"aid:%@", [NSNumber numberWithInt:aid]);
//        [queryDevicePhoto getFirstObjectInBackgroundWithBlock:^(PFObject *photo, NSError *error){
//            if (!error) {
//                //如果雲端上沒有資料就不處理
//                PFFile *photoFile = [photo objectForKey:@"picMedium"];
//                [photoFile getDataInBackgroundWithBlock:^(NSData *photoData, NSError *error){
//                    if (!error) {
//                        completionBlock(true, [UIImage imageWithData:photoData]);
//                        //存Cache
//                        [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceImage:[UIImage imageWithData:photoData] deviceName:[photo objectForKey:@"name"]];
//                    }else{
//                        completionBlock(false, nil);
//                    }
//                }];
//                
//                if ([photo objectForKey:@"name"]) {
//                    //存Cache
//                    [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceName:[photo objectForKey:@"name"]];
//                }
//            }else{
//                completionBlock(false, nil);
//            }
//        }];
//    }
//#endif
//}
//
//// 讀取雲端設備照片，依accessoryType
//+ (void) getDevicePhotoCachedThenNetwork:(NSString *)deviceUID andAID:(int)aid byAccessoryType:(int)type block:(void (^)(BOOL succeeded, UIImage *image))completionBlock
//{
//#if defined(DEF_isLanNetWork)
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    NSString *imageFilePath = [NSString stringWithFormat:@"%@%i.png", deviceUID, aid];// pictures stored in the local Documents
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    //获取文件路径
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//    //不管存在不存在都需要儲存
//    if ([fileManager fileExistsAtPath:path]) {
//        NSData *mediumimageData = [NSData dataWithContentsOfFile:path];
//        //有設備的照片檔案
//        completionBlock (TRUE, [UIImage imageWithData:mediumimageData]);
//    }else{
//        //沒有Cache就先依Type回傳預設的照片
//        [self displayDefaultPictureFromType:type block:^(BOOL succeeded, UIImage *image) {
//            if (succeeded) {
//                completionBlock(true, image);
//            }
//        }];
//    }
//#else
//    //讀取雲端的照片
//    if ([[AICache sharedCache] hasPhotoByUID:deviceUID andAID:aid]) {
//        //有Cache就先讀
//        completionBlock(true, [[AICache sharedCache] imageForUID:deviceUID andAID:aid]);
//        
//        //接著背景下載照片
//        PFQuery *queryDevicePhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//        [queryDevicePhoto whereKey:@"UID" equalTo:deviceUID];
//        [queryDevicePhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//        [queryDevicePhoto getFirstObjectInBackgroundWithBlock:^(PFObject *photo, NSError *error){
//            if (!error) {
//                PFFile *photoFile = [photo objectForKey:@"picMedium"];
//                //如果雲端上沒有資料就不處理
//                [photoFile getDataInBackgroundWithBlock:^(NSData *photoData, NSError *error){
//                    if (!error) {
//                        //存Cache
//                        [[AICache sharedCache] setPhotoToUID:deviceUID andAID:aid deviceImage:[UIImage imageWithData:photoData]];
//                    }else{
//                        
//                    }
//                }];
//                if ([photo objectForKey:@"name"]) {
//                    //存Cache
//                    [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceName:[photo objectForKey:@"name"]];
//                }
//            }else{
//                
//            }
//        }];
//        
//    }else{
//        //沒有Cache就先依Type回傳預設的照片
//        [self displayDefaultPictureFromType:type block:^(BOOL succeeded, UIImage *image) {
//            if (succeeded) {
//                completionBlock(true, image);
//            }
//        }];
//        
//        //再背景抓取照片回來
//        PFQuery *queryDevicePhoto = [PFQuery queryWithClassName:@"devicePhoto"];
//        [queryDevicePhoto whereKey:@"UID" equalTo:deviceUID];
//        [queryDevicePhoto whereKey:@"AID" equalTo:[NSNumber numberWithInt:aid]];
//        GLog(tUI, @"deviceUID:%@", deviceUID);
//        GLog(tUI, @"aid:%@", [NSNumber numberWithInt:aid]);
//        
//        [queryDevicePhoto getFirstObjectInBackgroundWithBlock:^(PFObject *photo, NSError *error){
//            if (!error) {
//                //如果雲端上有資料
//                //先緩存設備名稱
//                [[AICache sharedCache] setNameToUID:deviceUID andAID:aid deviceName:[photo objectForKey:@"name"]];
//                
//                //在讀取照片檔案
//                PFFile *photoFile = [photo objectForKey:@"picMedium"];
//                [photoFile getDataInBackgroundWithBlock:^(NSData *photoData, NSError *error){
//                    if (!error) {
//                        completionBlock(true, [UIImage imageWithData:photoData]);
//                        //存Cache
//                        [[AICache sharedCache] setPhotoToUID:deviceUID andAID:aid deviceImage:[UIImage imageWithData:photoData]];
//                    }else{
//                        //本地端沒有照片且雲端上也沒有照片，依照accessoryType回傳該Type的預設照片
//                        
//                    }
//                }];
//                
//                if ([photo objectForKey:@"name"]) {
//                    //存Cache
//                    [[AICache sharedCache] setAttributesForDevice:photo uid:deviceUID aid:aid deviceName:[photo objectForKey:@"name"]];
//                }
//            }else{
//                GLog(tUI, @"設備沒有照片");
//            }
//        }];
//    }
//#endif
//    
//}
//
//+ (void) displayDefaultPictureFromType:(int)type block:(void (^)(BOOL succeeded, UIImage *image))completionBlock
//{
//    switch (type) {
//        case Accessory_Type_Door:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_door"]);
//        }   break;
//            
//        case Accessory_Type_Smoke:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_smoke"]);
//        }   break;
//            
//        case Accessory_Type_WaterLeak:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_water"]);
//        }   break;
//            
//        case Accessory_Type_PIR:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_pir"]);
//        }   break;
//            
//        case Accessory_Type_Gas:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_gas"]);
//        }   break;
//            
//        case Accessory_Type_Vibrate:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_vibration"]);
//        }   break;
//            
//        case Accessory_Type_IP_Camera:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_ipcam"]);
//        }   break;
//            
//        case Accessory_Type_IPCam:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_ipcam"]);
//        }   break;
//            
//        case Accessory_Type_Leak:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_water"]);
//        }   break;
//            
//        case Accessory_Type_Air_Conditioner:
//        {
//            completionBlock(true, [UIImage imageNamed:@""]);
//        }   break;
//            
//        case Accessory_Type_Siren:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_siren"]);
//        }   break;
//            
//        case Accessory_Type_Light:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_lighting"]);
//        }   break;
//            
//        case Accessory_Type_Gateway:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_gateway"]);
//        }   break;
//            
//        case Accessory_Type_Plug:
//        {
//            completionBlock(true, [UIImage imageNamed:@"icon_smartplug"]);
//        }   break;
//            
//        default:
//        {
//            completionBlock(true, [UIImage imageNamed:@""]);
//        }   break;
//    }
//}
//
//// 判斷Cell的總類，回應高度
//+ (CGFloat)getCellHightFromAccessoryType:(int)accessoryType{
//    switch (accessoryType) {
//        case Accessory_Type_Light:
//            return 131;
//            break;
//        case Accessory_Type_Plug:
//            return 89;
//            break;
//        default:
//            return 89;
//            break;
//    }
//}
//
//+ (enum AccessoryType) getAccessoryTypeWithClassCode:(unsigned short)classCode
//{
//    switch (classCode) {
//        case 0xF4:
//            return Accessory_Type_Gateway;
//            break;
//            
//        case 0xF2:
//            return Accessory_Type_Plug;
//            break;
//            
//        case 0xF1:
//            return Accessory_Type_Light;
//            break;
//            
//        case 0xEF:
//            return Accessory_Type_PIR;
//            break;
//            
//        case 0xEE:
//            return Accessory_Type_Door;
//            break;
//            
//        case 0xED:
//            return Accessory_Type_WaterLeak;
//            break;
//            
//        case 0xEC:
//            return Accessory_Type_Smoke;
//            break;
//            
//        case 0xEB:
//            return Accessory_Type_Siren;
//            break;
//            
//        case 0xEA:
//            return Accessory_Type_Gas;
//            break;
//            
//        case 0xE9:
//            return Accessory_Type_Vibrate;
//            break;
//            
//        default:
//            return Accessory_Type_IPCam;
//            break;
//    }
//}
//
//// 轉至指定的型態清單頁面
//+ (void) gotoAccessoryTypeListWithType:(enum AccessoryType)deviceType navigationController:(UINavigationController*)navigationController goToNavigationControlerArray:(NSArray*)goToNavigationControlerArray smartDevBase:(SmartDevBase*)smartDevBase
//{
//    switch (deviceType) {
//        case Accessory_Type_Light: {
//            [StoryboardUtility gotoLightingWithList:navigationController];
//        } break;
//            
//        case Accessory_Type_Plug: {
//            [StoryboardUtility gotoSmartPlugWithList:navigationController];
//        } break;
//            
//        case Accessory_Type_IP_Camera: {
//            [StoryboardUtility gotoIPCamWithList:navigationController];
//        } break;
//            
//        case Accessory_Type_Gateway: {
//            [Utility storyboardPushViewController:navigationController storyboardName:STORYBOARD_GATEWAY viewController:@"AddSensorViewController" viewControllerCallback:^(UIViewController *viewController)
//             {
//                 // 轉向新增gateway這條路
//                 AddSensorViewController *addSensorViewController = (AddSensorViewController*) viewController;
//                 addSensorViewController.gateway = (Gateway*) smartDevBase;
//                 addSensorViewController.isEasyWifi = YES;
//             }];
//            
//            //            [StoryboardUtility gotoGatewayWithList:self.navigationController];
//        }   break;
//            
//        case Accessory_Type_Door: {
//            [StoryboardUtility gotoDoorWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_Smoke: {
//            [StoryboardUtility gotoSmokeWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_WaterLeak: {
//            [StoryboardUtility gotoWaterLeakWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_PIR: {
//            [StoryboardUtility gotoPIRWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_Gas: {
//            [StoryboardUtility gotoGasWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_Vibrate: {
//            [StoryboardUtility gotoVibrateWithList:navigationController];
//        }   break;
//            
//        case Accessory_Type_Siren: {
//            [StoryboardUtility gotoSirenWithList:navigationController];
//        }   break;
//            
////        case Accessory_Type_Leak: {
////
////        }   break;
////
////        case Accessory_Type_Air_Conditioner: {
////
////        }   break;
//            
//        default: {
//            // 導向指定頁面
//            if (goToNavigationControlerArray != nil) {
//                [StoryboardUtility gotoNavigationControlers:navigationController navigationControlers:goToNavigationControlerArray];
//            } else {
//                GLog(tUI, @"deviceType not found");
//                [StoryboardUtility gotoMainViewController:navigationController];
//            }
//        }   break;
//    }
//}
//
//
//// 新增Group
//+ (void) saveGroup:(CreateGroup *)group block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
//    PFACL *ACL = [PFACL ACL];
//    [ACL setPublicReadAccess:YES];
//    [ACL setPublicWriteAccess:YES];
//    
//    //新增
//    PFObject *saveObject = [PFObject objectWithClassName:kGroupClassesKey];
//    
//    
//    [saveObject setObject:group.name forKey:kGroupName];
//    [saveObject setObject:group.accessoryIDArray forKey:kGroupAccessoryIDArray]; //儲存accessory_id的集合
//    if (group.photoFile) {
//        [saveObject setObject:group.photoFile forKey:kGroupPhotoFile];
//    }
//    if (group.photoSmallFile) {
//        [saveObject setObject:group.photoSmallFile forKey:kGroupPhotoSmallFile];
//    }
//    
//    [saveObject setObject:[PFUser currentUser] forKey:kGroupByUser];
//    
//    saveObject.ACL = ACL;
//    
//    
//#if DEF_isLanNetWork == 1
//    
//    PFQuery *queryLocalGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//    [queryLocalGroup whereKey:kGroupName equalTo:group.name];
//    [queryLocalGroup fromLocalDatastore];
//    [queryLocalGroup getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject2, NSError *error){
//        if (saveObject2) {
//            [saveObject2 pinInBackground];
//            completionBlock(FALSE,error);
//            //成功之後要release group
//            [group releaseThisGroup:group];
//        }else{
//            [saveObject pinInBackground];
//            
//            //本機端只要確認是否有本地的照片檔案
//            //创建文件管理器
//            if (group.photoFile) {
//                NSFileManager * fileManager = [NSFileManager defaultManager];
//                NSString *imageFilePath = [NSString stringWithFormat:@"%@.png", group.name];// pictures stored in the local Documents
//                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//                NSString *documentsDirectory = [paths objectAtIndex:0];
//                //获取文件路径
//                NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//                //不管存在不存在都需要儲存
//                
//                [fileManager createFileAtPath:path contents:group.photoFile.getData attributes:nil];
//            }
//            
//            completionBlock(TRUE,nil);
//            //成功之後要release group
//            [group releaseThisGroup:group];
//        }
//    }];
//    
//    
//    
//#else
//    [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//        if (succeeded) {
//            GLog(tUI, @"新增Group成功");
//            //Cache 這個Group資料
//            [[AICache sharedCache] setAttributesForGroup:saveObject groupName:group.name groupImage:[UIImage imageWithData:[group.photoFile getData]] deviceArray:group.accessoryIDArray];
//            
//            //成功之後要release group
//            [group releaseThisGroup:group];
//            
//            completionBlock(succeeded, error);
//        }else{
//            GLog(tUI, @"新增Group失敗");
//            completionBlock(succeeded, error);
//            //成功之後要release group
//            [group releaseThisGroup:group];
//        }
//    }];
//#endif
//}
//
//// 編輯Group
//+ (void) editGroup:(PFObject *)group groupName:(NSString *)groupNmae deviceArray:(NSArray *)deviceArray GroupImage:(UIImage *)groupImage isChangePhoto:(BOOL)isChangePhoto block:(void (^)(BOOL succeeded, PFObject *group))completionBlock
//{
//    
//    PFACL *ACL = [PFACL ACL];
//    [ACL setPublicReadAccess:YES];
//    [ACL setPublicWriteAccess:YES];
//    
//    PFFile *fileMediumImage = nil;
//    PFFile *fileSmallImage = nil;
//    NSData *mediumImageData = nil;
//    NSData *smallImageData = nil;
//    
////    if (isChangePhoto) {
//        UIImage *mediumImage = [groupImage thumbnailImage:640 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationHigh];
//        UIImage *smallImage = [groupImage thumbnailImage:100 transparentBorder:0 cornerRadius:0 interpolationQuality:kCGInterpolationLow];
//        
//        mediumImageData = UIImagePNGRepresentation(mediumImage);
//        smallImageData = UIImagePNGRepresentation(smallImage);
//        
//        fileMediumImage = [PFFile fileWithData:mediumImageData];
//        fileSmallImage = [PFFile fileWithData:smallImageData];
////    }
//    
//    //判斷Parse是否已經有這個group，有才覆蓋
//    PFQuery *isExistGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//    [isExistGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//    [isExistGroup whereKey:kGroupName equalTo:[group objectForKey:kGroupName]];
//    
//#if defined(DEF_isLanNetWork)
//    //區網情況
//    [isExistGroup fromLocalDatastore];
//    [isExistGroup getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject2, NSError *error){
//        if (error) {
//            //走新增流程
//            PFObject *saveObject = [PFObject objectWithClassName:kGroupClassesKey];
//            if (groupNmae.length > 0) {
//                [saveObject setObject:groupNmae forKey:kGroupName];
//            }
//            [saveObject setObject:deviceArray forKey:kGroupAccessoryIDArray];
//            [saveObject setObject:[PFUser currentUser] forKey:kGroupByUser];
////            if (fileMediumImage) {
//                [saveObject setObject:fileMediumImage forKey:kGroupPhotoFile];
//                [saveObject setObject:fileSmallImage forKey:kGroupPhotoSmallFile];
////            }
//            
//            saveObject.ACL = ACL;
//            
//            if (fileMediumImage) {
//                //本機端只要確認是否有本地的照片檔案
//                //创建文件管理器
//                NSFileManager * fileManager = [NSFileManager defaultManager];
//                NSString *imageFilePath = [NSString stringWithFormat:@"%@.png", groupNmae];// pictures stored in the local Documents
//                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//                NSString *documentsDirectory = [paths objectAtIndex:0];
//                //获取文件路径
//                NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//                //不管存在不存在都需要儲存
//                [fileManager createFileAtPath:path contents:mediumImageData attributes:nil];
//            }
//            
//            [saveObject pinInBackground];
//            GLog(tUI, @"編輯Group成功");
//            completionBlock(TRUE,saveObject);
//            
//        }else{
//            //已經既有一個Group，走覆蓋原始檔案流程
//            if (groupNmae.length > 0) {
//                [saveObject2 setObject:groupNmae forKey:kGroupName];
//            }
//            [saveObject2 setObject:deviceArray forKey:kGroupAccessoryIDArray];
//            [saveObject2 setObject:[PFUser currentUser] forKey:kGroupByUser];
//            if (fileMediumImage) {
//                [saveObject2 setObject:fileMediumImage forKey:kGroupPhotoFile];
//                [saveObject2 setObject:fileSmallImage forKey:kGroupPhotoSmallFile];
//            }
//            
//            saveObject2.ACL = ACL;
//            
//            if (fileMediumImage) {
//                //本機端只要確認是否有本地的照片檔案
//                //创建文件管理器
//                NSFileManager * fileManager = [NSFileManager defaultManager];
//                NSString *imageFilePath = [NSString stringWithFormat:@"%@.png", groupNmae];// pictures stored in the local Documents
//                NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//                NSString *documentsDirectory = [paths objectAtIndex:0];
//                //获取文件路径
//                NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//                //不管存在不存在都需要儲存
//                [fileManager createFileAtPath:path contents:mediumImageData attributes:nil];
//            }
//            
//            [saveObject2 pinInBackground];
//            GLog(tUI, @"編輯Group成功");
//            completionBlock(TRUE,saveObject2);
//        }
//    }];
//    
//#else
//    //有網路情況
//    [isExistGroup getFirstObjectInBackgroundWithBlock:^(PFObject *saveObject, NSError *error){
//        if (error) {
//            //沒有，走新增流程
//            PFObject *saveObject = [PFObject objectWithClassName:kGroupClassesKey];
//            if (groupNmae.length > 0) {
//                [saveObject setObject:groupNmae forKey:kGroupName];
//            }
//            [saveObject setObject:deviceArray forKey:kGroupAccessoryIDArray];
//            [saveObject setObject:[PFUser currentUser] forKey:kGroupByUser];
//            if (isChangePhoto) {
//                [saveObject setObject:fileMediumImage forKey:kGroupPhotoFile];
//                [saveObject setObject:fileSmallImage forKey:kGroupPhotoSmallFile];
//            }
//            
//            saveObject.ACL = ACL;
//            
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    GLog(tUI, @"新增Group成功");
//                    completionBlock(succeeded, saveObject);
//                    
//                    //成功之後要release group
//                    CreateGroup *group = [CreateGroup sharedCreateGroup];
//                    [group releaseThisGroup:group];
//                    
//                    //Cache 這個 group
//                    [[AICache sharedCache] setAttributesForGroup:saveObject groupName:groupNmae groupImage:groupImage deviceArray:deviceArray];
//                }else{
//                    GLog(tUI, @"新增Group失敗");
//                    completionBlock(FALSE, nil);
//                }
//            }];
//        }else{
//            //已經既有一個Group，走覆蓋原始檔案流程
//            if (groupNmae.length > 0) {
//                [saveObject setObject:groupNmae forKey:kGroupName];
//            }
//            [saveObject setObject:deviceArray forKey:kGroupAccessoryIDArray];
//            [saveObject setObject:[PFUser currentUser] forKey:kGroupByUser];
//            if (isChangePhoto) {
//                [saveObject setObject:fileMediumImage forKey:kGroupPhotoFile];
//                [saveObject setObject:fileSmallImage forKey:kGroupPhotoSmallFile];
//            }
//            
//            saveObject.ACL = ACL;
//            
//            [saveObject saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error){
//                if (succeeded) {
//                    GLog(tUI, @"編輯Group成功");
//                    completionBlock(succeeded,saveObject);
//                    //成功之後要release group
//                    CreateGroup *group = [CreateGroup sharedCreateGroup];
//                    [group releaseThisGroup:group];
//                    
//                    //Cache 這個 group
//                    [[AICache sharedCache] setAttributesForGroup:saveObject groupName:groupNmae groupImage:groupImage deviceArray:deviceArray];
//                    
//                    
//                }else{
//                    GLog(tUI, @"編輯Group失敗");
//                    completionBlock(FALSE, nil);
//                }
//            }];
//        }
//    }];
//#endif
//}
//
//// 取回某個用戶的Group清單，先從Cache 再從NetWork。
//+ (void) getUsersGroupsCacheThenNetwork:(PFUser *)currentUser block:(void (^)(BOOL succeeded, NSArray *groups))completionBlock
//{
//    
//#if DEF_isLanNetWork == 1 
//    //先看看有無LocalDatabase資料
//    PFQuery *query = [PFQuery queryWithClassName:kGroupClassesKey];
//    [query whereKey:kGroupByUser equalTo:currentUser];
//    [query fromLocalDatastore];
//    
//    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error){
//        if (!error) {
//            //有localDatabase
//            completionBlock(true, objects);
//        }else{
//            completionBlock(true, nil);
//        }
//    }];
//#else
//    if ([[[AICache sharedCache] getGroupsArrayFromUser:[PFUser currentUser]] count] > 0) {
//        //有Cache
//        completionBlock(true, [[AICache sharedCache] getGroupsArrayFromUser:[PFUser currentUser]]);
//        //讀取雲端資料
//        PFQuery *queryUserGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//        [queryUserGroup whereKey:kGroupByUser equalTo:currentUser];
//        [queryUserGroup findObjectsInBackgroundWithBlock:^(NSArray *foundObjects, NSError *error) {
//            if (!error) {
//                //成功取回之後，要進行Cache
//                [[AICache sharedCache] setAttributesGroups:foundObjects forUser:[PFUser currentUser]];
//                
//                completionBlock(true, foundObjects);
//            }else{
//                completionBlock(false, nil);
//            }
//        }];
//    } else {
//        //讀取雲端資料
//        PFQuery *queryUserGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//        [queryUserGroup whereKey:kGroupByUser equalTo:currentUser];
//        [queryUserGroup findObjectsInBackgroundWithBlock:^(NSArray *foundObjects, NSError *error) {
//            if (!error) {
//                //成功取回之後，要進行Cache
//                [[AICache sharedCache] setAttributesGroups:foundObjects forUser:[PFUser currentUser]];
//                
//                completionBlock(true, foundObjects);
//            }else{
//                completionBlock(false, nil);
//            }
//        }];
//    }
//#endif
//}
//
//
//// 取回雲端Group的照片
//+ (void) getGroupPhotoCachedThenNetwork:(PFObject *)group block:(void (^)(BOOL succeeded, UIImage *image))completionBlock
//{
//    
//#if DEF_isLanNetWork == 1 
//    NSFileManager * fileManager = [NSFileManager defaultManager];
//    NSString *imageFilePath = [NSString stringWithFormat:@"%@.png", [group objectForKey:@"name"]];// pictures stored in the local Documents
//    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//    NSString *documentsDirectory = [paths objectAtIndex:0];
//    //获取文件路径
//    NSString *path = [documentsDirectory stringByAppendingPathComponent:imageFilePath];
//    //不管存在不存在都需要儲存
//    if ([fileManager fileExistsAtPath:path]) {
//        NSData *mediumimageData = [NSData dataWithContentsOfFile:path];
//        //有設備的照片檔案
//        completionBlock (TRUE, [UIImage imageWithData:mediumimageData]);
//    }else{
//        //沒有Cache就先依Type回傳預設的照片
//        completionBlock(false, [UIImage imageNamed:@"icon_group"]);
//    }
//#else
//    //先看有無Cache資料
//    if ([[AICache sharedCache] hasCacheGroupPhoto:group]) {
//        //有Cache資料
//        completionBlock(true, [[AICache sharedCache] imageFromGroup:group]);
//        //讀取雲端資料，並重新cache
//        PFQuery *queryUserGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//        [queryUserGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//        [queryUserGroup getObjectInBackgroundWithId:group.objectId block:^(PFObject *group, NSError *error){
//            if (!error) {
//                //成功取回之後，要進行Cache
//                [[group objectForKey:kGroupPhotoFile] getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//                    if (!error) {
//                        [[AICache sharedCache] setAttributesForGroup:group groupName:[group objectForKey:kGroupName] groupImage:[UIImage imageWithData:imageData] deviceArray:[group objectForKey:kGroupAccessoryIDArray]];
//                    }
//                }];
//            }
//        }];
//    }else{
//        //無Cache資料
//        completionBlock(false, [UIImage imageNamed:@"icon_group"]);
//        PFQuery *queryUserGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//        [queryUserGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//        [queryUserGroup whereKeyExists:kGroupPhotoFile];
//        [queryUserGroup getObjectInBackgroundWithId:group.objectId block:^(PFObject *group, NSError *error){
//            if (!error) {
//                
//                //成功取回之後，要進行Cache
//                [[group objectForKey:kGroupPhotoFile] getDataInBackgroundWithBlock:^(NSData *imageData, NSError *error) {
//                    if (!error) {
//                        completionBlock(false, [UIImage imageWithData:imageData]);
//                        [[AICache sharedCache] setAttributesForGroup:group groupName:[group objectForKey:kGroupName] groupImage:[UIImage imageWithData:imageData] deviceArray:[group objectForKey:kGroupAccessoryIDArray]];
//                    }else{
//                        completionBlock(false, [UIImage imageNamed:@"icon_group"]);
//                    }
//                }];
//            }else{
//                //                completionBlock(false, [UIImage imageNamed:@"icon_group"]);
//            }
//        }];
//        
//    }
//#endif
//}
//
////根據AccessoryType取回種類名稱
//+ (NSString *) getKindNameWithAccessoryType:(int)type{
////    Accessory_Type_Gateway                       = 1,
////    Accessory_Type_Light                         = 2,
////    Accessory_Type_Plug                          = 3,
////    Accessory_Type_IPCam                         = 4,
////    Accessory_Type_Door                          = 11,
////    Accessory_Type_Smoke                         = 12,
////    Accessory_Type_WaterLeak                     = 13,
////    Accessory_Type_PIR                           = 14,
////    Accessory_Type_Gas                           = 15,
////    Accessory_Type_Vibrate                       = 16,
////    Accessory_Type_IP_Camera                     = 17,       // (中翰原本使⽤用17需要改成4)
////    Accessory_Type_Leak                          = 18,
////    Accessory_Type_Air_Conditioner               = 19,
////    Accessory_Type_Siren                         = 20,
//    
//    switch (type) {
//        case Accessory_Type_Gateway:
//            return @"Gateway";
//            break;
//        case Accessory_Type_Light:
//            return @"Light";
//            break;
//        case Accessory_Type_Plug:
//            return @"Smart Plug";
//            break;
//        case Accessory_Type_IPCam:
//            return @"IP Cam";
//            break;
//        case Accessory_Type_Door:
//            return @"Door";
//            break;
//        case Accessory_Type_Smoke:
//            return @"Smoke";
//            break;
//        case Accessory_Type_WaterLeak:
//            return @"Water";
//            break;
//        case Accessory_Type_PIR:
//            return @"PIR";
//            break;
//        case Accessory_Type_Gas:
//            return @"Gas";
//            break;
//        case Accessory_Type_Vibrate:
//            return @"Vibration";
//            break;
//        case Accessory_Type_IP_Camera:
//            return @"IP Cam";
//            break;
//        case Accessory_Type_Leak:
//            return @"Water";
//            break;
//        case Accessory_Type_Air_Conditioner:
//            return @"Air Conditioner";
//            break;
//        case Accessory_Type_Siren:
//            return @"Siren";
//            break;
//        default:
//            break;
//    }
//    return nil;
//}
//
//
//+ (void) deleteDeviceWithAccessory_ID:(int)accessory_id WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
////    1.先確定用戶是否有Group，2.再確認Group是否有包含該設備，移除該設備後，device數量是否為0
//    PFQuery *queryUsersGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//    [queryUsersGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//#if DEF_isLanNetWork == 1
//    [queryUsersGroup fromLocalDatastore];
//#else
//    
//#endif
//    [queryUsersGroup findObjectsInBackgroundWithBlock:^(NSArray *foundObjects, NSError *error) {
//        if (error) {
//            //用戶未曾增加Group
//            completionBlock(false, error);
//        }else{
//            for (PFObject *group in foundObjects) {
//                NSMutableArray *accessoryIDArray = [group objectForKey:kGroupAccessoryIDArray];
//                for (NSNumber *accessoryId in accessoryIDArray) {
//                    if ([accessoryId intValue] ==  accessory_id) {
//                        [accessoryIDArray removeObject:accessoryId];
//                    }
//                }
//                
//                PFACL *ACL = [PFACL ACL];
//                [ACL setPublicReadAccess:YES];
//                [ACL setPublicWriteAccess:YES];
//                
//                if (accessoryIDArray.count > 0) {
//                    //覆蓋儲存 group
//                    [group setObject:accessoryIDArray forKey:kGroupAccessoryIDArray];
//                    
//                    void (^localCompletionHandler) (BOOL, NSError*) = ^(BOOL succeeded, NSError *error) {
//                        if (succeeded) {
//                            if (completionBlock) completionBlock(true, error);
//                            //儲存完 Cache
//                            [[AICache sharedCache] setAttributesForGroup:group deviceArray:accessoryIDArray];
//                        } else {
//                            if (completionBlock) completionBlock(false, error);
//                        }
//                    };
//                    group.ACL = ACL;
//                    [group saveEventually:localCompletionHandler];
//                    
//                    
//                }else{
//#if DEF_isLanNetWork == 1
//                    [group unpinInBackground];
//#else
//                    //移除整個 group
//                    [group deleteEventually];
//#endif
//                    
//                    
//                }
//            }
//        }
//    }];
//}
//
//// 刪除gateway Device 同步Group
//+ (void) deleteDeviceWithAccessory_ID:(int)accessory_id withSensors:(NSArray *)sensors WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
//    //    1.先確定用戶是否有Group，2.再確認Group是否有包含該設備，移除該設備後，device數量是否為0
//    PFQuery *queryUsersGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//    [queryUsersGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//#if DEF_isLanNetWork == 1
//    [queryUsersGroup fromLocalDatastore];
//#else
//    
//#endif
//    [queryUsersGroup findObjectsInBackgroundWithBlock:^(NSArray *foundObjects, NSError *error) {
//        if (error) {
//            //用戶未曾增加Group
//            completionBlock(false, error);
//        }else{
//            for (PFObject *group in foundObjects) {
//                NSMutableArray *accessoryIDArray = [group objectForKey:kGroupAccessoryIDArray];
//                
//                NSMutableArray *deleteArray = [[NSMutableArray alloc] init];
//                // 刪除該gateway設備
//                for (NSNumber *accessoryId in accessoryIDArray) {
//                    [deleteArray addObject:accessoryId];
//                }
//                
//                [accessoryIDArray removeObjectsInArray:(NSArray *)deleteArray];
//                
//                
//                PFACL *ACL = [PFACL ACL];
//                [ACL setPublicReadAccess:YES];
//                [ACL setPublicWriteAccess:YES];
//                
//                if (accessoryIDArray.count > 0) {
//                    //覆蓋儲存 group
//                    [group setObject:accessoryIDArray forKey:kGroupAccessoryIDArray];
//                    
//                    void (^localCompletionHandler) (BOOL, NSError*) = ^(BOOL succeeded, NSError *error) {
//                        if (succeeded) {
//                            if (completionBlock) completionBlock(true, error);
//                            //儲存完 Cache
//                            [[AICache sharedCache] setAttributesForGroup:group deviceArray:accessoryIDArray];
//                        } else {
//                            if (completionBlock) completionBlock(false, error);
//                        }
//                    };
//                    group.ACL = ACL;
//                    [group saveEventually:localCompletionHandler];
//                    
//                    
//                }else{
//#if DEF_isLanNetWork == 1
//                    [group unpinInBackground];
//#else
//                    //移除整個 group
//                    [group deleteEventually];
//#endif
//                }
//            }
//        }
//    }];
//}

//// 刪除devies同步至Group
//+ (void) deleteDeviceWithAccessoryIDArray:(NSArray *)accessoryIdArray WithCurrentUser:(PFUser *)user block:(void (^)(BOOL succeeded, NSError *error))completionBlock
//{
////    1.先確定用戶是否有Group，2.再確認Group是否有包含該設備，移除該設備後，device數量是否為0
//    PFQuery *queryUsersGroup = [PFQuery queryWithClassName:kGroupClassesKey];
//    [queryUsersGroup whereKey:kGroupByUser equalTo:[PFUser currentUser]];
//    
//#if DEF_isLanNetWork == 1
//    [queryUsersGroup fromLocalDatastore];
//#else
//    
//#endif
//    [queryUsersGroup findObjectsInBackgroundWithBlock:^(NSArray *foundObjects, NSError *error) {
//        if (error) {
//            //用戶未曾增加Group
//            completionBlock(false, error);
//        }else{
//            for (PFObject *group in foundObjects) {
//                NSMutableArray *accessoryIDArray_origin = [group objectForKey:kGroupAccessoryIDArray];
//                for (NSNumber *accessoryId in accessoryIDArray_origin) {
//                    for (NSNumber *accessory in accessoryIdArray) {
//                        if ([accessoryId intValue] ==  [accessory intValue]) {
//                            [accessoryIDArray_origin removeObject:accessoryId];
//                        }
//                    }
//                }
//                
//                PFACL *ACL = [PFACL ACL];
//                [ACL setPublicReadAccess:YES];
//                [ACL setPublicWriteAccess:YES];
//                
//                if (accessoryIDArray_origin.count > 0) {
//                    //覆蓋儲存 group
//                    [group setObject:accessoryIDArray_origin forKey:kGroupAccessoryIDArray];
//                    
//                    void (^localCompletionHandler) (BOOL, NSError*) = ^(BOOL succeeded, NSError *error) {
//                        if (succeeded) {
//                            if (completionBlock) completionBlock(true, error);
//                            //儲存完 Cache
//                            [[AICache sharedCache] setAttributesForGroup:group deviceArray:accessoryIDArray_origin];
//                        } else {
//                            if (completionBlock) completionBlock(false, error);
//                        }
//                    };
//                    group.ACL = ACL;
//                    [group saveEventually:localCompletionHandler];
//                    
//                    
//                }else{
//#if DEF_isLanNetWork == 1
//                    [group unpinInBackground];
//#else
//                    //移除整個 group
//                    [group deleteEventually];
//#endif
//                }
//            }
//        }
//    }];
//}

@end
