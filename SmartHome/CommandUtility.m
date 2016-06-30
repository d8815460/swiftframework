//
//  CommandUtility.m
//  Kalay Home
//
//  Created by jakey on 2015/6/5.
//  Copyright (c) 2015年 TUTK. All rights reserved.
//

#import "CommandUtility.h"
#import "FunctionInfo.h"

@implementation CommandUtility

#pragma mark - Require Command

//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    unsigned int functionCodeArray[1];
//    functionCodeArray[0] = functionCode1;
//    
//    [CommandUtility require27WithfunctionCodeAmount:1 functionCodeArray:functionCodeArray device:device deviceType:type aid:aid];
//}
//
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    unsigned int functionCodeArray[2];
//    functionCodeArray[0] = functionCode1;
//    functionCodeArray[1] = functionCode2;
//    
//    [CommandUtility require27WithfunctionCodeAmount:2 functionCodeArray:functionCodeArray device:device deviceType:type aid:aid];
//}
//
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    unsigned int functionCodeArray[3];
//    functionCodeArray[0] = functionCode1;
//    functionCodeArray[1] = functionCode2;
//    functionCodeArray[2] = functionCode3;
//    
//    [CommandUtility require27WithfunctionCodeAmount:3 functionCodeArray:functionCodeArray device:device deviceType:type aid:aid];
//}
//
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 functionCode4:(unsigned int)functionCode4 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    unsigned int functionCodeArray[4];
//    functionCodeArray[0] = functionCode1;
//    functionCodeArray[1] = functionCode2;
//    functionCodeArray[2] = functionCode3;
//    functionCodeArray[3] = functionCode4;
//    
//    [CommandUtility require27WithfunctionCodeAmount:4 functionCodeArray:functionCodeArray device:device deviceType:type aid:aid];
//}
//
//+(void)require27WithFunctionCode1:(unsigned int)functionCode1 functionCode2:(unsigned int)functionCode2 functionCode3:(unsigned int)functionCode3 functionCode4:(unsigned int)functionCode4 functionCode5:(unsigned int)functionCode5 device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    unsigned int functionCodeArray[5];
//    functionCodeArray[0] = functionCode1;
//    functionCodeArray[1] = functionCode2;
//    functionCodeArray[2] = functionCode3;
//    functionCodeArray[3] = functionCode4;
//    functionCodeArray[4] = functionCode4;
//    
//    [CommandUtility require27WithfunctionCodeAmount:5 functionCodeArray:functionCodeArray device:device deviceType:type aid:aid];
//}
//
//+(void)require27WithfunctionCodeAmount:(unsigned int)functionCodeAmount functionCodeArray:(unsigned int[])functionCodeArray device:(SmartDevBase*)device deviceType:(unsigned int)type aid:(Byte)aid
//{
//    GLog(tUI, @"aid:%d", aid);
//    GLog(tUI, @"type:%d", type);
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO queryFunctionInfo[functionCodeAmount];
//
//    for (int i=0 ; i<functionCodeAmount ; i++) {
//        queryFunctionInfo[i].AID = aid;
//        queryFunctionInfo[i].type = type;
//        queryFunctionInfo[i].functionCode = functionCodeArray[i];
//        
//        GLog(tUI, @"functionCode:%d", queryFunctionInfo[i].functionCode);
//    }
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTION queryFunction;
//    queryFunction.totalCount = 1;
//    queryFunction.countIndex = 0;
//    queryFunction.amount = functionCodeAmount;
//    queryFunction.pTagAirConditionerTimeQueryFunctionInfo = queryFunctionInfo;
//    
//    [device requireCommand27_QueryFunction:&queryFunction];
//}
//
//+(void)require27WithFunctionInfoList:(NSArray*)functionInfoList device:(SmartDevBase*)device
//{
//    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO queryFunctionInfo[functionInfoList.count];
//    
//    for (int i=0 ; i<functionInfoList.count ; i++) {
//        FunctionInfo *functionInfo = functionInfoList[i];
//        
//        queryFunctionInfo[i].AID = functionInfo.aid;
//        queryFunctionInfo[i].type = functionInfo.type;
//        
//        GLog(tUI, @"aid:%d", queryFunctionInfo[i].AID);
//        GLog(tUI, @"type:%d", queryFunctionInfo[i].type);
//        
//        for (int j=0 ; j<functionInfo.functionStatusList.count ; j++) {
//            FunctionStatus* functionStatus = functionInfo.functionStatusList[j];
//            
//            queryFunctionInfo[i].functionCode = functionStatus.functionCode;
//            
//            GLog(tUI, @"functionCode:%d", queryFunctionInfo[i].functionCode);
//        }
//    }
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTION queryFunction;
//    queryFunction.totalCount = 1;
//    queryFunction.countIndex = 0;
//    queryFunction.amount = functionInfoList.count;
//    queryFunction.pTagAirConditionerTimeQueryFunctionInfo = queryFunctionInfo;
//    
//    [device requireCommand27_QueryFunction:&queryFunction];
//}
//
//// command 28 One TransferCode
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                    transferCode1:(unsigned short)transferCode1
//{
//    SAIRCONDITIONERFUNCTIONCODEINFO pFunctionCodeInfo[1];
//    pFunctionCodeInfo[0].transferCode = transferCode1;
//    [self require28WithFunctionCode1:functionCode1 device:device deviceType:deviceType aid:aid functionCodeInfoAmount:1 pFunctionCodeInfoArray:pFunctionCodeInfo];
//}
//
//// command 28 Two TransferCode
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                    transferCode1:(unsigned short)transferCode1
//                    transferCode2:(unsigned short)transferCode2
//{
//    SAIRCONDITIONERFUNCTIONCODEINFO pFunctionCodeInfo[2];
//    pFunctionCodeInfo[0].transferCode = transferCode1;
//    pFunctionCodeInfo[1].transferCode = transferCode2;
//    [self require28WithFunctionCode1:functionCode1 device:device deviceType:deviceType aid:aid functionCodeInfoAmount:2 pFunctionCodeInfoArray:pFunctionCodeInfo];
//}
//
//// command 28 Three TransferCode
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                    transferCode1:(unsigned short)transferCode1
//                    transferCode2:(unsigned short)transferCode2
//                    transferCode3:(unsigned short)transferCode3
//{
//    SAIRCONDITIONERFUNCTIONCODEINFO pFunctionCodeInfo[3];
//    pFunctionCodeInfo[0].transferCode = transferCode1;
//    pFunctionCodeInfo[1].transferCode = transferCode2;
//    pFunctionCodeInfo[2].transferCode = transferCode3;
//    [self require28WithFunctionCode1:functionCode1 device:device deviceType:deviceType aid:aid functionCodeInfoAmount:3 pFunctionCodeInfoArray:pFunctionCodeInfo];
//}
//
//// command 28 Four TransferCode
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                    transferCode1:(unsigned short)transferCode1
//                    transferCode2:(unsigned short)transferCode2
//                    transferCode3:(unsigned short)transferCode3
//                    transferCode4:(unsigned short)transferCode4
//{
//    SAIRCONDITIONERFUNCTIONCODEINFO pFunctionCodeInfo[4];
//    pFunctionCodeInfo[0].transferCode = transferCode1;
//    pFunctionCodeInfo[1].transferCode = transferCode2;
//    pFunctionCodeInfo[2].transferCode = transferCode3;
//    pFunctionCodeInfo[3].transferCode = transferCode4;
//    [self require28WithFunctionCode1:functionCode1 device:device deviceType:deviceType aid:aid functionCodeInfoAmount:4 pFunctionCodeInfoArray:pFunctionCodeInfo];
//}
//
//// command 28 N TransferCode (NSNumber => unsigned short)
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)deviceType
//                              aid:(Byte)aid
//                transferCodeArray:(NSArray*)transferCodeArray
//{
//    SAIRCONDITIONERFUNCTIONCODEINFO pFunctionCodeInfo[transferCodeArray.count];
//    
//    for (int i=0 ; i<transferCodeArray.count ; i++) {
//        int value = ((NSNumber*)[transferCodeArray objectAtIndex:i]).intValue;
//        GLog(tUI, @"value:%d", value);
//        pFunctionCodeInfo[i].transferCode = value;
//    }
//    
//    [self require28WithFunctionCode1:functionCode1 device:device deviceType:deviceType aid:aid functionCodeInfoAmount:transferCodeArray.count pFunctionCodeInfoArray:pFunctionCodeInfo];
//}
//
//// command 28
//+(void)require28WithFunctionCode1:(unsigned int)functionCode1
//                           device:(SmartDevBase*)device
//                       deviceType:(unsigned int)type
//                              aid:(Byte)aid
//           functionCodeInfoAmount:(Byte)functionCodeInfoAmount
//           pFunctionCodeInfoArray:(LPSAIRCONDITIONERFUNCTIONCODEINFO)pFunctionCodeInfoArray
//{
//    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO pTagTUTKPlugTimeQueryFunctionInfoArray[1];
//    pTagTUTKPlugTimeQueryFunctionInfoArray[0].AID = aid;
//    pTagTUTKPlugTimeQueryFunctionInfoArray[0].type = type;
//    pTagTUTKPlugTimeQueryFunctionInfoArray[0].functionCode = functionCode1;
//    
//    pTagTUTKPlugTimeQueryFunctionInfoArray[0].functionCodeAmount = functionCodeInfoAmount;
//    SAIRCONDITIONERFUNCTIONCODEINFO pTagAirconditionerFunctionCodeInfo[functionCodeInfoAmount];
//    for (int i=0 ; i<functionCodeInfoAmount ; i++) {
//        pTagAirconditionerFunctionCodeInfo[i].transferCode = pFunctionCodeInfoArray[i].transferCode;
//    }
//    pTagTUTKPlugTimeQueryFunctionInfoArray[0].pTagAirconditionerFunctionCodeInfo = pTagAirconditionerFunctionCodeInfo;
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTION TUTKPlugTimeQueryFunctionArray;
//    // 修改開關
//    TUTKPlugTimeQueryFunctionArray.totalCount = 1;
//    TUTKPlugTimeQueryFunctionArray.countIndex = 0;
//    TUTKPlugTimeQueryFunctionArray.amount = 1;
//    TUTKPlugTimeQueryFunctionArray.pTagAirConditionerTimeQueryFunctionInfo = pTagTUTKPlugTimeQueryFunctionInfoArray;
//    
//    [device requireCommand28_EditFunction:&TUTKPlugTimeQueryFunctionArray];
//}
//
//+(void)require28WithFunctionStatus:(FunctionStatus*)functionStatus
//                            device:(SmartDevBase*)device
//                        deviceType:(unsigned int)type
//                               aid:(Byte)aid
//{
//    NSArray *functionStatusArray = [NSArray arrayWithObjects:functionStatus, nil];
//    [CommandUtility require28WithFunctionStatusArray:functionStatusArray device:device deviceType:type aid:aid];
//}
//
//+(void)require28WithFunctionCodeStatus1:(FunctionStatus*)functionStatus1
//                        functionStatus2:(FunctionStatus*)functionStatus2
//                                 device:(SmartDevBase*)device
//                             deviceType:(unsigned int)type aid:(Byte)aid
//{
//    NSArray *functionStatusArray = [NSArray arrayWithObjects:functionStatus1, functionStatus2, nil];
//    [CommandUtility require28WithFunctionStatusArray:functionStatusArray device:device deviceType:type aid:aid];
//}
//
//+(void)require28WithFunctionStatusArray:(NSArray*)functionStatusArray
//                                 device:(SmartDevBase*)device
//                             deviceType:(unsigned int)type
//                                    aid:(Byte)aid
//{
//    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO pTagTUTKPlugTimeQueryFunctionInfoArray[functionStatusArray.count];
//    for (int i=0 ; i<functionStatusArray.count ; i++) {
//        FunctionStatus *functionStatus = ((FunctionStatus*) [functionStatusArray objectAtIndex:i]);
//        
//        pTagTUTKPlugTimeQueryFunctionInfoArray[i].AID = aid;
//        pTagTUTKPlugTimeQueryFunctionInfoArray[i].type = type;
//        pTagTUTKPlugTimeQueryFunctionInfoArray[i].functionCode = functionStatus.functionCode;
//    
//        pTagTUTKPlugTimeQueryFunctionInfoArray[i].functionCodeAmount = functionStatus.transferCodeArrayList.count;
//        pTagTUTKPlugTimeQueryFunctionInfoArray[i].pTagAirconditionerFunctionCodeInfo = malloc(sizeof(SAIRCONDITIONERFUNCTIONCODEINFO) * functionStatus.transferCodeArrayList.count);
//        
//        for (int j=0 ; j<functionStatus.transferCodeArrayList.count ; j++) {
//            NSNumber *number = (NSNumber*) [functionStatus.transferCodeArrayList objectAtIndex:j];
//            pTagTUTKPlugTimeQueryFunctionInfoArray[i].pTagAirconditionerFunctionCodeInfo[j].transferCode = [number intValue];
//            GLog(tUI, @"transferCode:%d", pTagTUTKPlugTimeQueryFunctionInfoArray[i].pTagAirconditionerFunctionCodeInfo[j].transferCode);
//        }
//    }
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTION TUTKPlugTimeQueryFunctionArray;
//    // 修改開關
//    TUTKPlugTimeQueryFunctionArray.totalCount = 1;
//    TUTKPlugTimeQueryFunctionArray.countIndex = 0;
//    TUTKPlugTimeQueryFunctionArray.amount = 1;
//    TUTKPlugTimeQueryFunctionArray.pTagAirConditionerTimeQueryFunctionInfo = pTagTUTKPlugTimeQueryFunctionInfoArray;
//    
////    GLog(tUI, @"transferCode:%d", pTagTUTKPlugTimeQueryFunctionInfoArray[0].pTagAirconditionerFunctionCodeInfo[0].transferCode);
////    GLog(tUI, @"transferCode:%d", TUTKPlugTimeQueryFunctionArray.pTagAirConditionerTimeQueryFunctionInfo[0].pTagAirconditionerFunctionCodeInfo[0].transferCode);
//    
//    [device requireCommand28_EditFunction:&TUTKPlugTimeQueryFunctionArray];
//    
//    for (int i=0 ; i<functionStatusArray.count ; i++) {
//        FunctionStatus *functionStatus = ((FunctionStatus*) [functionStatusArray objectAtIndex:i]);
//        for (int j=0 ; j<functionStatus.transferCodeArrayList.count ; j++) {
//            (pTagTUTKPlugTimeQueryFunctionInfoArray[i].pTagAirconditionerFunctionCodeInfo); //To do list
//        }
//    }
//    
//}
//
//+(void)require28WithFunctionInfoArray:(NSArray*)functionInfoList
//                               device:(SmartDevBase*)device
//{
//    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO functionInfoArray[functionInfoList.count];
////    SAIRCONDITIONERTIMEQUERYFUNCTIONINFO *pFunctionInfoArray = malloc(sizeof(SAIRCONDITIONERTIMEQUERYFUNCTIONINFO) * functionInfoList.count);
//    
//    for (int i=0 ; i<functionInfoList.count ; i++) {
//        FunctionInfo *functionInfo = ((FunctionInfo*) [functionInfoList objectAtIndex:i]);
//        
//        functionInfoArray[i].AID = functionInfo.aid;
//        functionInfoArray[i].type = functionInfo.type;
//        GLog(tUI, @"functionInfoArray[%d].AID:%d", i, functionInfoArray[i].AID);
//        GLog(tUI, @"functionInfoArray[%d].type:%d", i, functionInfoArray[i].type);
//        
//        for (int j=0 ; j<functionInfo.functionStatusList.count ; j++) {
//            FunctionStatus *functionStatus = functionInfo.functionStatusList[j];
//            
//            functionInfoArray[i].functionCode = functionStatus.functionCode;
//            functionInfoArray[i].functionCodeAmount = functionStatus.transferCodeArrayList.count;
//            
//            functionInfoArray[i].pTagAirconditionerFunctionCodeInfo = malloc(sizeof(SAIRCONDITIONERFUNCTIONCODEINFO) * functionStatus.transferCodeArrayList.count);
//            for (int k=0 ; k<functionStatus.transferCodeArrayList.count ; k++) {
//                NSNumber *number = (NSNumber*) functionStatus.transferCodeArrayList[k];
//                
//                functionInfoArray[i].pTagAirconditionerFunctionCodeInfo[k].transferCode = [number intValue];
//                GLog(tUI, @"transferCode:%d", functionInfoArray[i].pTagAirconditionerFunctionCodeInfo[k].transferCode);
//            }
//        }
//    }
//    
//    SAIRCONDITIONERTIMEQUERYFUNCTION queryFunctionArray;
//    queryFunctionArray.totalCount = 1;
//    queryFunctionArray.countIndex = 0;
//    queryFunctionArray.amount = functionInfoList.count;
//    queryFunctionArray.pTagAirConditionerTimeQueryFunctionInfo = functionInfoArray;
//    
////    GLog(tUI, @"transferCode:%d", pTagTUTKPlugTimeQueryFunctionInfoArray[0].pTagAirconditionerFunctionCodeInfo[0].transferCode);
////    GLog(tUI, @"transferCode:%d", TUTKPlugTimeQueryFunctionArray.pTagAirConditionerTimeQueryFunctionInfo[0].pTagAirconditionerFunctionCodeInfo[0].transferCode);
//    
//    [device requireCommand28_EditFunction:&queryFunctionArray];
//    
//    for (int i=0 ; i<functionInfoList.count ; i++) {
//        free(functionInfoArray[i].pTagAirconditionerFunctionCodeInfo);
//    }
//}
//
//#pragma mark - Response Command
//
//+(void)responseCommand19Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock];
//}
//
///* command 24 */
//
//+(void)responseCommand24HelperWithReturnFunctionStatusBlock:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
//    GLog(tUI, @"totalCount:%d", pAirConditionerAccessoryItem->totalCount);
//    GLog(tUI, @"countIndex:%d", pAirConditionerAccessoryItem->countIndex);
//    GLog(tUI, @"amount:%d", pAirConditionerAccessoryItem->amount);
//    
//    if (amountBlock != nil) {
//        amountBlock(pAirConditionerAccessoryItem->totalCount, pAirConditionerAccessoryItem->countIndex, pAirConditionerAccessoryItem->amount);
//    }
//    
//    for (int i=0 ; i<pAirConditionerAccessoryItem->amount ; i++) {
//        GLog(tUI, @"%d AID:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID);
//        GLog(tUI, @"%d Type:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type);
//        GLog(tUI, @"%d FunctionAmount:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount);
//        
//        BOOL result = functionStatusBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID,
//                            pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type,
//                            i);
//        
//        if (result == YES) {
//            for (int j=0 ; j<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount ; j++) {
//                //            GLog(tUI, @"%d,%d FunctionCode:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode);
//                //            GLog(tUI, @"%d,%d FunctionCodeAmount:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount);
//                
//                unsigned short pTransferCodeArray[pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount];
//                for (int k=0 ; k<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount ; k++) {
//                    pTransferCodeArray[k] = pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].pTagAirconditionerFunctionCodeInfo[k].transferCode;
//                }
//                
//                functionCodeBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode,
//                                  j,
//                                  pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount,
//                                  pTransferCodeArray
//                                  );
//            }
//        }
//    }
//    
//    completeBlock();
//}
//
//+(void)responseCommand24HelperWithReturnFunctionStatusBlock:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//                                        functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//                                  functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeWithTypeBlock
//                                                amountBlock:(ResponseCommandAmountBlock)amountBlock
//                                              completeBlock:(CompleteBlock)completeBlock
//{
//    GLog(tUI, @"totalCount:%d", pAirConditionerAccessoryItem->totalCount);
//    GLog(tUI, @"countIndex:%d", pAirConditionerAccessoryItem->countIndex);
//    GLog(tUI, @"amount:%d", pAirConditionerAccessoryItem->amount);
//    
//    if (amountBlock != nil) {
//        amountBlock(pAirConditionerAccessoryItem->totalCount, pAirConditionerAccessoryItem->countIndex, pAirConditionerAccessoryItem->amount);
//    }
//    
//    for (int i=0 ; i<pAirConditionerAccessoryItem->amount ; i++) {
//        GLog(tUI, @"%d AID:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID);
//        GLog(tUI, @"%d Type:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type);
//        GLog(tUI, @"%d FunctionAmount:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount);
//        
//        BOOL result = functionStatusBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID,
//                                          pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type,
//                                          i);
//        
//        if (result == YES) {
//            for (int j=0 ; j<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount ; j++) {
//                //            GLog(tUI, @"%d,%d FunctionCode:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode);
//                //            GLog(tUI, @"%d,%d FunctionCodeAmount:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount);
//                
//                unsigned short pTransferCodeArray[pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount];
//                for (int k=0 ; k<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount ; k++) {
//                    pTransferCodeArray[k] = pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].pTagAirconditionerFunctionCodeInfo[k].transferCode;
//                }
//                
//                functionCodeWithTypeBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode,
//                                  j,
//                                  pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount,
//                                  pTransferCodeArray,
//                                  pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type
//                                  );
//            }
//        }
//    }
//    
//    completeBlock();
//}
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//{
//    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock amountBlock:amountBlock completeBlock:nil];
//}
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
//    GLog(tUI, @"totalCount:%d", pAirConditionerAccessoryItem->totalCount);
//    GLog(tUI, @"countIndex:%d", pAirConditionerAccessoryItem->countIndex);
//    GLog(tUI, @"amount:%d", pAirConditionerAccessoryItem->amount);
//    
//    if (amountBlock != nil) {
//        amountBlock(pAirConditionerAccessoryItem->totalCount, pAirConditionerAccessoryItem->countIndex, pAirConditionerAccessoryItem->amount);
//    }
//    
//    for (int i=0 ; i<pAirConditionerAccessoryItem->amount ; i++) {
//        GLog(tUI, @"%d AID:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID);
//        GLog(tUI, @"%d Type:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type);
//        GLog(tUI, @"%d FunctionAmount:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount);
//        
//        functionStatusBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID,
//                            pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type,
//                            i);
//        
//        for (int j=0 ; j<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount ; j++) {
//            //            GLog(tUI, @"%d,%d FunctionCode:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode);
//            //            GLog(tUI, @"%d,%d FunctionCodeAmount:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount);
//            
//            unsigned short pTransferCodeArray[pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount];
//            for (int k=0 ; k<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount ; k++) {
//                pTransferCodeArray[k] = pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].pTagAirconditionerFunctionCodeInfo[k].transferCode;
//            }
//            
//            functionCodeBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode,
//                              j,
//                              pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount,
//                              pTransferCodeArray
//                              );
//        }
//    }
//    
//    if (completeBlock != nil) {
//        completeBlock();
//    }
//}
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//     functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeBlockWithType
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
//    GLog(tUI, @"totalCount:%d", pAirConditionerAccessoryItem->totalCount);
//    GLog(tUI, @"countIndex:%d", pAirConditionerAccessoryItem->countIndex);
//    GLog(tUI, @"amount:%d", pAirConditionerAccessoryItem->amount);
//    
//    if (amountBlock != nil) {
//        amountBlock(pAirConditionerAccessoryItem->totalCount, pAirConditionerAccessoryItem->countIndex, pAirConditionerAccessoryItem->amount);
//    }
//    
//    for (int i=0 ; i<pAirConditionerAccessoryItem->amount ; i++) {
//        GLog(tUI, @"%d AID:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID);
//        GLog(tUI, @"%d Type:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type);
//        GLog(tUI, @"%d FunctionAmount:%d", i, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount);
//        
//        functionStatusBlock(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].AID,
//                            pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type,
//                            i);
//        
//        for (int j=0 ; j<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].FunctionAmount ; j++) {
//            //            GLog(tUI, @"%d,%d FunctionCode:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode);
//            //            GLog(tUI, @"%d,%d FunctionCodeAmount:%d", i, j, pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount);
//            
//            unsigned short pTransferCodeArray[pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount];
//            for (int k=0 ; k<pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount ; k++) {
//                pTransferCodeArray[k] = pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].pTagAirconditionerFunctionCodeInfo[k].transferCode;
//            }
//            
//            functionCodeBlockWithType(pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCode,
//                              j,
//                              pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].pTagAirconditionerFunctionTypeInfo[j].FunctionCodeAmount,
//                              pTransferCodeArray,
//                              pAirConditionerAccessoryItem->pTagAirConditionerInfo[i].Type
//                              );
//        }
//    }
//    
//    if (completeBlock != nil) {
//        completeBlock();
//    }
//}
//
//+(void)responseCommand24Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock amountBlock:nil];
//}
//
///* command 27 */
//+(void)responseCommand27Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//          responseCommandBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    [CommandUtility responseCommand27Helper:pQueryFunction functionStatusBlock:nil functionCodeBlock:functionCodeBlock];
//}
//
//+(void)responseCommand27Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//          functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//          functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    for (int i=0 ; i<pQueryFunction->amount ; i++) {
//        GLog(tUI, @"i:%d, AID:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID);
//        GLog(tUI, @"i:%d, Type:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type);
//        GLog(tUI, @"i:%d, functionCode:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode);
//        GLog(tUI, @"i:%d, functionCodeAmount:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount);
//        
//        if (functionStatusBlock != nil) {
//            functionStatusBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID,
//                                pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type,
//                                i);
//        }
//        
//        unsigned short pTransferCodeArray[pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount];
//        for (int j=0 ; j<pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount ; j++) {
//            pTransferCodeArray[j] = pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].pTagAirconditionerFunctionCodeInfo[j].transferCode;
//        }
//        
//        functionCodeBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode, i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount, pTransferCodeArray);
//    }
//}
//
//+(void)responseCommand27HelperWithfunctionStatusBlockReturn:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//                                        functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//                                          functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock
//                                               completeBlock:(CompleteBlock)completeBlock
//{
//    for (int i=0 ; i<pQueryFunction->amount ; i++) {
//        GLog(tUI, @"i:%d, AID:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID);
//        GLog(tUI, @"i:%d, Type:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type);
//        GLog(tUI, @"i:%d, functionCode:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode);
//        GLog(tUI, @"i:%d, functionCodeAmount:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount);
//        
//        BOOL isRunning = YES;
//        if (functionStatusBlock != nil) {
//            isRunning = functionStatusBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID,
//                                            pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type,
//                                            i);
//        }
//        
//        BOOL isfunctionCodeDone = NO;
//        if (isRunning == YES) {
//            unsigned short pTransferCodeArray[pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount];
//            for (int j=0 ; j<pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount ; j++) {
//                pTransferCodeArray[j] = pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].pTagAirconditionerFunctionCodeInfo[j].transferCode;
//            }
//            
//            isfunctionCodeDone = functionCodeBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode, i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount, pTransferCodeArray);
//        }
//    }
//    
//    if (completeBlock != nil) {
//        completeBlock();
//    }
//}
//
///* command 28 */
//+(void)responseCommand28Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pEditFunction
//          responseCommandBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    [CommandUtility responseCommand27Helper:pEditFunction responseCommandBlock:functionCodeBlock];
//}
//
//+(void)responseCommand28Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pEditFunction
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//{
//    [CommandUtility responseCommand27Helper:pEditFunction functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock];
//}
//
///* command 30 */
//
//+(void)responseCommand30HelperWithAccessoryItemsIndex:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//                                  functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturnAndAccessoryItemsIndex)functionStatusBlock
//                                    functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturnAndAccessoryItemsIndex)functionCodeBlock
//                                        completeBlock:(CompleteBlock)completeBlock
//{
//    for (int i=0 ; i<pQueryFunction->amount ; i++) {
//        GLog(tUI, @"i:%d, AID:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID);
//        GLog(tUI, @"i:%d, Type:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type);
//        GLog(tUI, @"i:%d, functionCode:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode);
//        GLog(tUI, @"i:%d, functionCodeAmount:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount);
//        
//        BOOL isRunning = YES;
//        int accessoryItemsIndex = -1;
//        
//        if (functionStatusBlock != nil) {
//            isRunning = functionStatusBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID,
//                                            pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type,
//                                            i,
//                                            &accessoryItemsIndex);
//        }
//        
//        BOOL isfunctionCodeDone = NO;
//        if (isRunning == YES) {
//            unsigned short pTransferCodeArray[pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount];
//            for (int j=0 ; j<pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount ; j++) {
//                pTransferCodeArray[j] = pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].pTagAirconditionerFunctionCodeInfo[j].transferCode;
//            }
//            
//            isfunctionCodeDone = functionCodeBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode, i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount, pTransferCodeArray, accessoryItemsIndex);
//        }
//    }
//    
//    if (completeBlock != nil) {
//        completeBlock();
//    }
//}
//
//+(void)responseCommand30Helper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pQueryFunction
//           functionStatusBlock:(ResponseCommandFunctionStatusBlockWithReturn)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
//    for (int i=0 ; i<pQueryFunction->amount ; i++) {
//        GLog(tUI, @"i:%d, AID:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID);
//        GLog(tUI, @"i:%d, Type:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type);
//        GLog(tUI, @"i:%d, functionCode:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode);
//        GLog(tUI, @"i:%d, functionCodeAmount:%d", i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount);
//        
//        BOOL isRunning = YES;
//        if (functionStatusBlock != nil) {
//            isRunning = functionStatusBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].AID,
//                                            pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].type,
//                                            i);
//        }
//        
//        BOOL isfunctionCodeDone = NO;
//        if (isRunning == YES) {
//            unsigned short pTransferCodeArray[pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount];
//            for (int j=0 ; j<pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount ; j++) {
//                pTransferCodeArray[j] = pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].pTagAirconditionerFunctionCodeInfo[j].transferCode;
//            }
//            
//            isfunctionCodeDone = functionCodeBlock(pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCode, i, pQueryFunction->pTagAirConditionerTimeQueryFunctionInfo[i].functionCodeAmount, pTransferCodeArray);
//        }
//    }
//    
//    if (completeBlock != nil) {
//        completeBlock();
//    }
//}
//
///* command 31 */
//
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
//    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock amountBlock:amountBlock completeBlock:completeBlock];
//}
//
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//     functionCodeWithTypeBlock:(ResponseCommandFunctionCodeBlockWithType)functionCodeBlockWithType
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//                 completeBlock:(CompleteBlock)completeBlock
//{
////    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlockWithType amountBlock:amountBlock completeBlock:completeBlock];
//    [CommandUtility responseCommand24Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeWithTypeBlock:functionCodeBlockWithType amountBlock:amountBlock completeBlock:completeBlock];
//}
//
//+(void)responseCommand31Helper:(LPSAIRCONDITIONERACCESSORYITEM)pAirConditionerAccessoryItem
//           functionStatusBlock:(ResponseCommandFunctionStatusBlock)functionStatusBlock
//             functionCodeBlock:(ResponseCommandFunctionCodeBlock)functionCodeBlock
//                   amountBlock:(ResponseCommandAmountBlock)amountBlock
//{
//    [CommandUtility responseCommand31Helper:pAirConditionerAccessoryItem functionStatusBlock:functionStatusBlock functionCodeBlock:functionCodeBlock amountBlock:amountBlock];
//}
//
///***** response wapper *****/
//
//+(void)responseCommand30Wrapper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pDeviceReportToClient
//                   smartDevBase:(SmartDevBase*)smartDevBase
//        accessoryItemsInfoArray:(NSArray*)accessoryItemsInfoArray
//              functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturnAndAccessoryItemsIndex)functionCodeBlock
//{
//    GLog(tUI, @"SID:%d", pDeviceReportToClient->SID);
//    GLog(tUI, @"totalCount:%d", pDeviceReportToClient->totalCount);    //1 傳送總次數
//    GLog(tUI, @"countIndex:%d", pDeviceReportToClient->countIndex);    //0 傳送之index
//    GLog(tUI, @"amount:%d", pDeviceReportToClient->amount);            //1 共回覆 1個附屬物件
//    
//    ResponseCommandFunctionStatusBlockWithReturnAndAccessoryItemsIndex functionStateBlock = ^BOOL (Byte aid_, unsigned int type_, int functionStatusIndex, int* outAccessoryItemsIndex)
//    {
//        GLog(tUI, @"functionStateBlock uid:%@ aid:%d type:%d", smartDevBase.mstrUid, aid_, type_);
//        
//        for (int i=0 ; i<accessoryItemsInfoArray.count ; i++) {
//            NSObject* object = [accessoryItemsInfoArray objectAtIndex:i];
//            
//            if ([object isKindOfClass:NSMutableDictionary.class]) {
//                NSMutableDictionary* dict = (NSMutableDictionary*) object;
//                
//                unsigned int type = [[dict objectForKey:@"type"] intValue];
//                int aid = [[dict objectForKey:@"AID"] intValue];
//                
//                if (aid == aid_ && type == type_) {
//                    *outAccessoryItemsIndex = i;
//                    return YES;
//                }
//            }
//        }
//        
//        return NO;
//    };
//    
//    [CommandUtility responseCommand30HelperWithAccessoryItemsIndex:pDeviceReportToClient functionStatusBlock:functionStateBlock functionCodeBlock:functionCodeBlock completeBlock:^{
//        GLog(tUI, @"completeBlock");
//        
////        [smartDevBase requireCommand30_DeviceReportToClient:pDeviceReportToClient];
//    }];
//}
//
//+(void)responseCommand30Wrapper:(LPSEDITAIRCONDITIONERMESSAGERECORDING)pDeviceReportToClient
//                   smartDevBase:(SmartDevBase*)smartDevBase
//                            aid:(int)aid
//                           type:(int)type
//              functionCodeBlock:(ResponseCommandFunctionCodeBlockWithReturn)functionCodeBlock
//{
//    GLog(tUI, @"SID:%d", pDeviceReportToClient->SID);
//    GLog(tUI, @"totalCount:%d", pDeviceReportToClient->totalCount);    //1 傳送總次數
//    GLog(tUI, @"countIndex:%d", pDeviceReportToClient->countIndex);    //0 傳送之index
//    GLog(tUI, @"amount:%d", pDeviceReportToClient->amount);            //1 共回覆 1個附屬物件
//    
//    ResponseCommandFunctionStatusBlockWithReturn functionStateBlock = ^BOOL (Byte aid_, unsigned int type_, int functionStatusIndex)
//    {
//        GLog(tUI, @"functionStateBlock aid:%d type:%d", aid_, type_);
//        
//        if (aid == aid_ && type == type_) {
//            return YES;
//        }
//        else {
//            return NO;
//        }
//    };
//    
//    [CommandUtility responseCommand30Helper:pDeviceReportToClient functionStatusBlock:functionStateBlock functionCodeBlock:functionCodeBlock completeBlock:^{
//        GLog(tUI, @"completeBlock");
//        
////        [smartDevBase requireCommand30_DeviceReportToClient:pDeviceReportToClient];
//    }];
//}

@end
