//
//  TradeRecordVM.m
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "TradeRecordVM.h"

@implementation TradeRecordVM

- (void)getDataWithSuccess:(SuccessBlock)success fail:(FailBlock)fail{
    
    int pageSize = 12;
    [[NetworkManager sharedNetworkManager]reqAapitalInfoWithToken:[StaticTools obtainToken] pageNow:1 pageSize:pageSize success:^(id model) {
        NSLog(@"reqTradeRecordInfo----%@", model);
        TradeRecordModel *feed = [TradeRecordModel mj_objectWithKeyValues:model];
        if (feed.data.count > 0) {
            NSMutableArray *tradeRecordItems = [NSMutableArray array];
            for (TradeRecordItem *item in feed.data) {
                [tradeRecordItems addObject:item];
            }
            success(tradeRecordItems);
        }
    } failure:^(NSError *err) {
        fail(err);
    }];
    
}
@end
