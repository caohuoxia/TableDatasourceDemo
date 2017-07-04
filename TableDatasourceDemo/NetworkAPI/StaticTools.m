//
//  StaticTools.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "StaticTools.h"


@implementation StaticTools
+ (instancetype)shareStaticTools
{
    static StaticTools *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tool = [[StaticTools alloc] init];
    });
    return tool;
}

+ (void)saveToken:(NSString *)token{
    NSUserDefaults *userDefault = [NSUserDefaults standardUserDefaults];
    [userDefault setObject:token forKey:@"token"];
    [userDefault synchronize];
}

+ (NSString *)obtainToken{
    return [[NSUserDefaults standardUserDefaults] objectForKey:@"token"];
}

//词典转换为字符串
- (NSString*)dictionaryToJson:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSData data];
    if (dic) {
        jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    }
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

#pragma mark- 得到md5(token+随机数+掩码) 参数，并添加随机数，签名参数
- (NSMutableDictionary *)addParaWithOriginDic:(NSMutableDictionary *)dict
{
    NSString *str = [self dictionaryToJson:dict];
    //查找token
    if ([str rangeOfString:@"token"].location != NSNotFound) {
        //4位随机数
        NSString *randomNumber = [self randomNumber];
        
        //md5加密之后的签名
        NSString *token = [dict valueForKey:@"token"];
        NSString* stringMD5 = [self signWithToken:token random:randomNumber];
        //添加random和sign两个参数
        [dict setValue:randomNumber forKey:@"random"];
        [dict setValue:stringMD5 forKey:@"sign"];
    }else{
        //不包含要检查的字符串,不含有token，不用处理
    }
    
    return dict;
}

//生成4位随机数
- (NSString *)randomNumber{
    int num = (arc4random() % 10000);
    NSString *randomNumber = [NSString stringWithFormat:@"%.4d", num];
    return randomNumber;
}

- (NSString *)signWithToken:(NSString *)token random:(NSString *)randomNumber{
    NSString *stringMerge = [NSString stringWithFormat:@"%@%@%@",MD5KEY, randomNumber, token];
    NSString *stringMD5 = [self md5_base64:stringMerge];
    return stringMD5;
}

//md5加密之后再base64，服务器端密码加密方法
- (NSString *) md5_base64:(NSString *)srcString
{
    if(srcString)
    {
        const char *cStr = [srcString UTF8String];
        unsigned char digest[CC_MD5_DIGEST_LENGTH];
        CC_MD5( cStr, strlen(cStr), digest );
        
        NSData * data_base64 = [[NSData alloc]initWithBytes:digest length:CC_MD5_DIGEST_LENGTH];
        data_base64 = [GTMBase64 encodeData:data_base64];
        
        NSString * outputString = [[NSString alloc] initWithData:data_base64 encoding:NSUTF8StringEncoding];
        return outputString;
    }
    
    return nil;
}

#pragma mark- User-Agent添加自定义参数
+ (NSString *)setUserAgentWithParam:(NSString *)param{
    NSMutableString *newAgent;
    UIWebView *webView = [[UIWebView alloc] init];
    NSString *userAgent = [webView stringByEvaluatingJavaScriptFromString:@"navigator.userAgent"];
    
    NSString *version_current = [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
    newAgent = [NSMutableString stringWithString:userAgent];
    //查找Helloan_IOS_APP字符串
    NSRange substr = [newAgent rangeOfString:@"Helloan_IOS_APP"];
    if (substr.location != NSNotFound) {
        //有这个字符串，不做处理
    }else{
        //没有的话追加
        [newAgent appendFormat:@"%@%@", @" Helloan_IOS_APP/",version_current];
    }
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:newAgent, @"UserAgent", nil];
    [[NSUserDefaults standardUserDefaults] registerDefaults:dictionary];
    
    if ([param isEqualToString:@"web"]) {
        //加载web页面
        return nil;
    }else{
        //afn接口请求，手动添加次参数
        return newAgent;
    }
}
@end
