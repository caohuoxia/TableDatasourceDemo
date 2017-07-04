//
//  TradeRecordModel.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TradeRecordModel.h"

@implementation TradeRecordItem

@end

@implementation TradeRecordModel
+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"data":@"TradeRecordItem"
             };
}
@end
