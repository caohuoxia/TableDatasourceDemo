//
//  Network_define.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#ifndef Network_define_h
#define Network_define_h

#define DOMAINNAME @"dev"
#define PORT @""
#define serVersion  @"1"
#define serName  @"mobile"
#define BASE_URL [NSString stringWithFormat:@"http://%@.helloan.cn%@",DOMAINNAME,PORT]


#pragma mark- 用户登录
#define USERLOGIN         @"/mobile/rest/login/doLogin"
#define URL_POST_USERLOGIN    [NSString stringWithFormat:@"%@%@",BASE_URL,USERLOGIN]

#pragma mark- 获取资金流水信息
#define CAPITALINFO        [NSString stringWithFormat:@"/%@/rest/capital/getDetail/%@",serName,serVersion]
#define URL_GET_CAPITALINFO    [NSString stringWithFormat:@"%@%@",BASE_URL,CAPITALINFO]



#endif /* Network_define_h */
