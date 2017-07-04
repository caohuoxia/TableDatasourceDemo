//
//  NetworkManager.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNManager.h"
#import "Network_define.h"

@interface NetworkManager : NSObject
{
    RequestMethod method;
}
//全局逻辑模块的单例
+ (instancetype)sharedNetworkManager;


- (void)postLoginWithAccount:(NSString *)account
                    password:(NSString *)pwd
                     success:(CompletePost)success
                     failure:(CompleteFailure)failure;
- (void)reqAapitalInfoWithToken:(NSString *)token
                        pageNow:(int)pageNow
                       pageSize:(int)pageSize
                        success:(CompletedGet)success
                        failure:(CompleteFailure)failure;
@end
