//
//  NetworkManage.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "StaticTools.h"

typedef void (^CompletedGet)(id model);
typedef void (^CompletePost)(id model);
typedef void (^CompleteFailure)(NSError *err);

typedef NS_ENUM(NSInteger, RequestMethod)
{
    post,
    get
};


@interface AFNManager : NSObject

+ (instancetype)shareAFNManager;

/**
 * requestMethod:请求方式
 * urlString:请求地址
 * parameters:请求参数
 * responseBlock:请求成功或失败的回调
 */

- (void)requestWithMethod:(RequestMethod)requestMethod
             andUrlString:(NSString *)urlString
            andParameters:(id) parameters
                  success:(CompletePost)success
                  failure:(CompleteFailure)failure;
@end
