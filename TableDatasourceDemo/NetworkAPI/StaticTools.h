//
//  StaticTools.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CommonCrypto/CommonDigest.h>
#import <CommonCrypto/CommonCryptor.h>
#import "GTMBase64.h"
#import <UIKit/UIKit.h>

#define MD5KEY @"ULiqNIncrg3WBI3t"

@interface StaticTools : NSObject
+ (instancetype)shareStaticTools;
+ (NSString *)setUserAgentWithParam:(NSString *)param;
+ (void)saveToken:(NSString *)token;
+ (NSString *)obtainToken;
- (NSMutableDictionary *)addParaWithOriginDic:(NSMutableDictionary *)dict;
@end
