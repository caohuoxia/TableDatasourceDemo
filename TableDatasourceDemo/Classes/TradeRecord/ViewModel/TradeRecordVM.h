//
//  TradeRecordVM.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/27.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MJExtension.h>
#import "NetworkManager.h"

#import "TradeRecordModel.h"

typedef void(^SuccessBlock)(NSMutableArray *datalist);
typedef void(^FailBlock)(NSError *err);

@interface TradeRecordVM : NSObject
- (void)getDataWithSuccess:(SuccessBlock)success fail:(FailBlock)fail;
@end
