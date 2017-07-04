//
//  NetworkManager.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "NetworkManager.h"

@implementation NetworkManager
+ (instancetype)sharedNetworkManager
{
    static NetworkManager *manager;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[super allocWithZone:NULL] init];
    });
    return manager;
}
+(instancetype)allocWithZone:(struct _NSZone *)zone{
    return [NetworkManager sharedNetworkManager];
}

+(id)copyWithZone:(struct _NSZone *)zone{
    return [NetworkManager sharedNetworkManager];
}

#pragma mark- 登录接口
- (void)postLoginWithAccount:(NSString *)account
                    password:(NSString *)pwd
                     success:(CompletePost)success
                     failure:(CompleteFailure)failure
{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setValue:account forKey:@"username"];
    [para setValue:pwd forKey:@"pwd"];
    //存管登录接口，返回是否开户字段
    [para setValue:@"1.1" forKey:@"version"];
    
    method = post;
    [[AFNManager shareAFNManager] requestWithMethod:method andUrlString:URL_POST_USERLOGIN andParameters:para success:success failure:failure];
}

#pragma mark- 请求资金流水列表页面
- (void)reqAapitalInfoWithToken:(NSString *)token
                        pageNow:(int)pageNow
                       pageSize:(int)pageSize
                        success:(CompletedGet)success
                        failure:(CompleteFailure)failure
{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    [para setValue:token forKey:@"token"];
    [para setValue:[NSString stringWithFormat:@"%d",pageNow] forKey:@"pageNow"];
    [para setValue:[NSString stringWithFormat:@"%d",pageSize] forKey:@"pageSize"];
    
    method = get;
    [[AFNManager shareAFNManager] requestWithMethod:method andUrlString:URL_GET_CAPITALINFO andParameters:para success:success failure:failure];
}
@end
