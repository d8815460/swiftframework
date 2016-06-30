//
//  CommandUtility.h
//  Kalay Home
//
//  Created by jakey on 2015/6/5.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ResponseCommandFunctionStatusBlock) (Byte aid, unsigned int type, int functionStatusIndex);
typedef BOOL (^ResponseCommandFunctionStatusBlockWithReturn) (Byte aid, unsigned int type, int functionStatusIndex);
typedef BOOL (^ResponseCommandFunctionStatusBlockWithReturnAndAccessoryItemsIndex) (Byte aid, unsigned int type, int functionStatusIndex, int* outAccessoryItemsIndex);

typedef void (^ResponseCommandFunctionCodeBlock) (unsigned int functionCode, int functionCodeIndex, int transferCodeLength, unsigned short* pTransferCodeArray);
typedef void (^ResponseCommandFunctionCodeBlockWithType) (unsigned int functionCode, int functionCodeIndex, int transferCodeLength, unsigned short* pTransferCodeArray, unsigned int type);
typedef BOOL (^ResponseCommandFunctionCodeBlockWithReturn) (unsigned int functionCode, int functionCodeIndex, int transferCodeLength, unsigned short* pTransferCodeArray);
typedef BOOL (^ResponseCommandFunctionCodeBlockWithReturnAndAccessoryItemsIndex) (unsigned int functionCode, int functionCodeIndex, int transferCodeLength, unsigned short* pTransferCodeArray, int accessoryItemsIndex);

typedef void (^ResponseCommandAmountBlock) (Byte totalCount, Byte countIndex, Byte amount);

typedef void (^CompleteBlock)();

@interface CommandUtility : NSObject

/***** require *****/

// require command 27
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 functionCode4:(unsigned int)functionCode4 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 functionCode4:(unsigned int)functionCode4 functionCode5:(unsigned int)functionCode5 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithfunctionCodeAmount:(unsigned int)functionCodeAmount functionCodeArray:(unsigned int[])functionCodeArray device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//+(void)require27WithFunctionInfoList:(NSArray*)functionInfoList device:(SmartDevBase*)device;
//
//// require command 28
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)deviceType aid:(Byte)aid transferCode1:(unsigned short)transferCode1;
//
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)deviceType aid:(Byte)aid transferCode1:(unsigned short)transferCode1 transferCode2:(unsigned short)transferCode2;
//
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)deviceType aid:(Byte)aid transferCode1:(unsigned short)transferCode1 transferCode2:(unsigned short)transferCode2 transferCode3:(unsigned short)transferCode3;
//
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                    transferCode1:(unsigned short)transferCode1
//                    transferCode2:(unsigned short)transferCode2
//                    transferCode3:(unsigned short)transferCode3
//                    transferCode4:(unsigned short)transferCode4;
//
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid functionCodeInfoAmount:(Byte)functionCodeInfoAmount pFunctionCodeInfoArray:(LPSAIRCONDITIONERFUNCTIONCODEINFO)pFunctionCodeInfoArray;
//
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)deviceType aid:(Byte)aid transferCodeArray:(NSArray*)transferCodeArray;
//
//+(void)require28WithFunctionStatusArray:(NSArray*)functionStatusArray device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid;
//
//+(void)require28WithFunctionInfoArray:(NSArray*)functionInfoList
//                               device:(SmartDevBase*)device;
//
///***** response *****/
//
//// command 19
//+(void)responseCommand19Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//// command 24
//
//+(void)responseCommand24HelperWithReturnFunctionStatusBlock:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//                                        functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//                                          functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                                                amountBlock:(ResponseCommandAmountBlock)amountBlock
//                                              completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand24HelperWithReturnFunctionStatusBlock:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//                                        functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//                                  functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeWithTypeBlock
//                                                amountBlock:(ResponseCommandAmountBlock)amountBlock
//                                              completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//     functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeBlockWithType
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock;
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//// command 27
//+(void)responseCommand27Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//          responseCommandBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//+(void)responseCommand27Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//+(void)responseCommand27HelperWithfunctionStatusBlockReturn:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//                                        functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//                                          functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock
//                                              completeBlock:(CompleteBlock)completeBlock;
//
//// command 28
//+(void)responseCommand28Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pEditFunction
//          responseCommandBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//+(void)responseCommand28Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pEditFunction
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock;
//
//// command 30
//+(void)responseCommand30HelperWithAccessoryItemsIndex:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//                                  functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturnAndAccessoryItemsIndex)functionStatusBlock
//                                    functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturnAndAccessoryItemsIndex)functionCodeBlock
//                                        completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand30Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//           functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock
//                 completeBlock:(CompleteBlock)completeBlock;
//
//// command 31
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//     functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeBlockWithType
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock;
//
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock;
//
///***** response wapper *****/
//
//+(void)responseCommand30Wrapper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pDeviceReportToClient smartDevBase:(SmartDevBase*)smartDevBase accessoryItemsInfoArray:(NSArray*)accessoryItemsInfoArray functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturnAndAccessoryItemsIndex)functionCodeBlock;
//
//+(void)responseCommand30Wrapper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pDeviceReportToClient smartDevBase:(SmartDevBase*)smartDevBase aid:(int)aid type:(int)type functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock;

@end
