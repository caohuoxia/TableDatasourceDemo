//
//  TradeRecordCell.h
//  TableDatasourceDemo
//
//  Created by admin on 2017/6/26.
//  Copyright © 2017年 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TradeRecordCell : UITableViewCell
+ (instancetype)cellWithTableview:(UITableView*)tableview;
- (void)cellWithModel:(id)model;
@end
