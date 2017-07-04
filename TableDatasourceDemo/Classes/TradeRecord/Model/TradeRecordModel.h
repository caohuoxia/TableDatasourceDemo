//
//  TradeRecordModel.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "BaseResponseModel.h"

@interface TradeRecordItem : NSObject
@property(nonatomic,strong)NSString *createDate;
@property(nonatomic,strong)NSString *operate;
@property(nonatomic,strong)NSString *name;
@property(nonatomic,strong)NSString *balance;
@end

@interface TradeRecordModel : BaseResponseModel
@property(nonatomic,strong)NSArray *data;
@end
