//
//  BaseResponseModel.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponseModel : NSObject
//服务器返回状态码
@property(nonatomic,assign) NSInteger code;

//服务器返回结果信息
@property(nonatomic,strong) NSString *message;

//服务器响应时间
@property(nonatomic,strong) NSString *responseTime;
@end
