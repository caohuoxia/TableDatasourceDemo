//
//  NetworkManage.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "AFNManager.h"

@implementation AFNManager
+ (instancetype)shareAFNManager
{
    static AFNManager *networkTools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        networkTools = [[AFNManager alloc] init];
    });
    return networkTools;
}

#pragma mark- 数据请求，post和get
- (void)requestWithMethod:(RequestMethod)requestMethod
             andUrlString:(NSString *)urlString
            andParameters:(id) parameters
                  success:(CompletePost)success
                  failure:(CompleteFailure)failure
{
    AFHTTPSessionManager *session = [AFHTTPSessionManager manager];
        
    //设置自定义代理参数
    [session.requestSerializer setValue:[StaticTools setUserAgentWithParam:@"afn"] forHTTPHeaderField:@"User-Agent"];
    
    //配置https
    session.securityPolicy = [self customSecurityPolicy];
    session.securityPolicy.allowInvalidCertificates = YES;
    
    //[self addParaWithOriginDic:parameters] ,判断参数是否带token，若有的话 添加随机数和签名参数
    NSMutableDictionary *paras = [[StaticTools shareStaticTools] addParaWithOriginDic:parameters];
    if (requestMethod == get) {
        [session GET:urlString parameters:paras progress:^(NSProgress * _Nonnull downloadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    } else {
        [session POST:urlString parameters:paras progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            success(responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
            if (error.code == -1001) {
                //做超时之后的一些操作
            }
        }];
    }
}

#pragma mark- 配置https
- (AFSecurityPolicy *)customSecurityPolicy
{
    /** https */
    NSString*cerPath = [[NSBundle mainBundle] pathForResource:@"m.helloan.cn.cer"ofType:nil];
    NSData*cerData = [NSData dataWithContentsOfFile:cerPath];
    NSSet*set = [[NSSet alloc] initWithObjects:cerData,nil];
    AFSecurityPolicy *policy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate withPinnedCertificates:set];
    return policy;
}
@end
