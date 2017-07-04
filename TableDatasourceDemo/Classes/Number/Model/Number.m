//
//  Number.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "Number.h"

@implementation Number
+ (instancetype)number{
    Number *num = [[Number alloc]init];
    
    num.title = [NSString stringWithFormat:@"%d", arc4random_uniform(100000)];
    
    int random = arc4random_uniform(2);
    if (random == 1) {
        num.detail = @"这个页面是银行的，我们暂时控制不了，只能给他们提意见进行优化。遇见这个问题的时候尽量引导用户使用IE，一般这个都会做兼容性适配，出问题的几率更小";
    }else{
        num.detail = num.title;
    }
    
    
    return num;
}

@end
